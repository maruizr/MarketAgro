from django import forms
from django.db.models import fields
from . models import Categoria, Producto, Tipo_producto, Proveedor, Usuario, Comuna, Region

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = '__all__'

