from django import forms
from django.db.models import fields
from . models import Categoria, Productos, Proveedor, Usuario, Comuna, Region

class ProductosForm(forms.ModelForm):
    product = forms.CharField(label='Nombre', max_length=200, widget=forms.TextInput(
        attrs={
            'class':'form-control'
        }
    ))
    precio = forms.CharField(label='Precio', max_length=200, widget=forms.TextInput(
        attrs={
            'class':'form-control'
        }
    ))
    categoria = forms.ModelChoiceField(queryset=Categoria.objects.all(), label='Categoría',
    widget=forms.Select(
        attrs={
            'class':'form-control'
        }
    ))
    image = forms.ImageField(label='Imagen',
    widget=forms.ClearableFileInput(
        attrs={
            'class':'form-control'
        }
    ))

    class Meta:
        model = Productos
        fields = ('product', 'precio', 'categoria', 'url', 'image',)