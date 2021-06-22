from django.contrib import admin
from . models import Categoria, Productos, Proveedor, Usuario, Comuna, Region

# Register your models here.
admin.site.register(Categoria)
admin.site.register(Proveedor)
admin.site.register(Productos)
admin.site.register(Usuario)
admin.site.register(Comuna)
admin.site.register(Region)