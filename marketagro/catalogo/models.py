from typing import Text
from django.db import models
from django.db.models.fields import UUIDField
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

    class Meta:
        ordering = ['nombre_tienda']

    def __str__(self):
        return self.nombre_tienda 

class Productos(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    product = models.CharField(max_length=200)
    precio = models.CharField(max_length=8)
    categoria = models.ForeignKey('Categoria', on_delete=models.SET_NULL, null=True, blank=False)

    class Meta:
        ordering =['product']

    def __str__(self):
        return self.product


