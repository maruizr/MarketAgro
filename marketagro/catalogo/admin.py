from django.contrib import admin
from . models import Categoria, Productos, Proveedor

# Register your models here.

admin.site.register(Categoria)
admin.site.register(Proveedor)
admin.site.register(Productos)
