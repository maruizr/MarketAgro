from django.db import models
from django.db.models.deletion import SET_NULL
from django.urls import reverse
import uuid

# Create your models here.
class Categoria(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, help_text="Id única para la categoría")
    name = models.CharField(max_length=200)

    class Meta:
        ordering=['name']

    def __str__(self):
        return self.name

class Proveedor(models.Model):
    rut = models.CharField(primary_key=True, max_length=9)
    nombre = models.CharField(max_length=200)
    apellido = models.CharField(max_length=200)
    apellido_m = models.CharField(max_length=200)
    nombre_tienda = models.CharField(max_length=200)
    ubicacion = models.CharField(max_length=200)
    username = models.CharField(max_length=20, null=True)
    contraseña = models.CharField(max_length=50, null=True)
    direccion = models.CharField(max_length=200, null=True)
    comuna = models.ForeignKey('Comuna', on_delete=models.SET_NULL, null=True)
    region = models.ForeignKey('Region', on_delete=models.SET_NULL, null=True)


    class Meta:
        ordering = ['nombre_tienda']

    def __str__(self):
        return self.nombre_tienda 

class Productos(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    product = models.CharField(max_length=200)
    precio = models.CharField(max_length=8)
    categoria = models.ForeignKey('Categoria', on_delete=models.SET_NULL, null=True)
    url = models.URLField(max_length=100, default='')
    image = models.ImageField(upload_to='images/', null=True, blank=True)

    class Meta:
        ordering =['product']

    def __str__(self):
        return self.product

class Usuario(models.Model):
    rut = models.CharField(max_length=9)
    nombre = models.CharField(max_length=200)
    apellido_p = models.CharField(max_length=200)
    apellido_m = models.CharField(max_length=200)
    direccion = models.CharField(max_length=200)
    comuna = models.ForeignKey('Comuna', on_delete=models.SET_NULL, null=True)
    region = models.ForeignKey('Region', on_delete=models.SET_NULL, null=True)
    username = models.CharField(max_length=20, null=True)
    contraseña = models.CharField(max_length=20, null=True)

    class Meta:
        ordering = ['nombre']

    def __str__(self):
        return self.nombre

class Comuna(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    comuna = models.CharField(max_length=50)
    region = models.ForeignKey('Region', on_delete=models.SET_NULL, null=True)

    class Meta:
        ordering = ['comuna']

    def __str__(self):
        return self.comuna

class Region(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    region = models.CharField(max_length=50)

    class Meta:
        ordering = ['region']

    def __str__(self):
        return self.region