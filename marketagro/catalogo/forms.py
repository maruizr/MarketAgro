from django import forms
from django.db.models import fields
from django.http import request
from . models import Categoria, Producto, Tipo_producto, Proveedor, Usuario, Comuna, Region

class ProductoForm(forms.ModelForm):
    id_prod = forms.CharField(label="Código Producto", required=True, max_length=10, widget=forms.TextInput(
        attrs={
            'class':'form-control'
        }
    ))
    nom_prod = forms.CharField(label="Nombre Producto", required=True, max_length=150, widget=forms.TextInput(
        attrs={
            'class':'form-control'
        }
    ))
    precio = forms.IntegerField(label="Precio", required=True, max_value=8, widget=forms.NumberInput(
        attrs={
            'class':'form-control'
        }
    ))
    categoria_id_cate = forms.ModelChoiceField(queryset=Categoria.objects.all(), label="Categoria Producto", required=True, widget=forms.Select(
        attrs={
            'class':'form-control'
        }
    ))
    tipo_producto_id_tipo = forms.ModelChoiceField(queryset=Tipo_producto.objects.all(), label="Tipo producto", required=True, widget=forms.Select(
        attrs={
            'class':'form-control'
        }
    ))
    proveedor_rut = forms.ModelChoiceField(queryset=Proveedor.objects.all(), label="Nombre Proveedor", required=False, widget=forms.Select(
        attrs={
            'class':'form-control'
        }
    ))
    imagen = forms.ImageField(label='Imagen', required=True, widget=forms.FileInput(
        attrs={
            'class': 'form-control'
        }
    ))
    
    class Meta:
        model = Producto
        fields = ('id_prod','nom_prod','precio','categoria_id_cate','tipo_producto_id_tipo','proveedor_rut','imagen')

