from django.shortcuts import render, redirect, get_object_or_404
from . models import Categoria, Producto, Tipo_producto, Proveedor, Usuario, Comuna, Region
from . forms import ProductosForm
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from django.views import generic
import cx_Oracle

# Create your views here.

def index(request):
    return render(
        request,
        'home.html'
    )

def catalogo(request):
    return render(
        request,
        'catalogo.html'
    )

def inicio_sesión(request):
    return render(
        request,
        'login.html'
    )