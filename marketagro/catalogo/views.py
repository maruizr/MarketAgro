import django
from django.shortcuts import render, redirect, get_object_or_404
from . models import Categoria, Producto, Tipo_producto, Proveedor, Usuario, Comuna, Region
from . forms import ProductoForm
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.views import generic
from django.db import connection
import cx_Oracle
import base64
from django.core.files.base import ContentFile
from django.http import HttpResponse

# Create your views here.

def index(request):
    return render(
        request,
        'home.html'
    )

def catalogo(request):
    return render(
        request,
        'catalogo.html',
    )

def inicio_sesión(request):
    return render(
        request,
        'login.html'
    )

def form_cr_prod(request):
    data = {
        'form': ProductoForm(),
        "prod": lista_prod(),
    }
    return render(request, 'productos/producto-form.html',data)

def lista_prod():

    cursor_dj = connection.cursor()
    cursor_ex = cursor_dj.connection.cursor() 
    cursor_out= cursor_dj.connection.cursor() 
    cursor_ex.callproc('P_LISTA_PRODUCTOS',[cursor_out])

    producto = []
    for i in cursor_out:
        producto.append(        {
            'data':i,
            'imagen':str(base64.b64encode(i[9].read()),'utf-8')
        })

    return producto

def create_prod(request):
    try:
        if request.method == 'POST':
            id_prod = request.POST.get('id_prod','')
            nom_prod = request.POST.get('nom_prod','')
            precio = request.POST.get('precio','')
            categoria = request.POST.get('categoria_id_cate','')
            tipo_prod = request.POST.get('tipo_producto_id_tipo','')
            proveedor = request.POST.get('proveedor_rut','')
            imagen = request.FILES['imagen'].read()

            agregar_producto(id_prod, nom_prod, precio, categoria, tipo_prod, proveedor, imagen)
            data = {
                'productos':lista_prod(),
                #"msj":"exi_create",
            }
            return redirect('catalogo')
    except:
        data = {
                'productos': lista_prod(),
                #"msj": "error_create",

            }
        return redirect('form_cr_prod')

def agregar_producto(id_prod,nom_prod,precio,categoria,tipo_producto,proveedor,imagen):
    cursor_dj = connection.cursor()
    cursor_ex = cursor_dj.connection.cursor() 
    salida = cursor_ex.var(cx_Oracle.NUMBER)
    cursor_ex.callproc('P_AGREGAR_PRODUCTO',[id_prod,nom_prod,precio,categoria,tipo_producto,proveedor,imagen,salida])

