from django.contrib import admin
from . models import Categoria, Proveedor, Producto, Carro, Comuna, Region, Usuario, Tipo_producto

# Register your models here.
admin.site.register(Categoria)
admin.site.register(Proveedor)
admin.site.register(Producto)
admin.site.register(Carro)
admin.site.register(Region)
admin.site.register(Comuna)
admin.site.register(Tipo_producto)
admin.site.register(Usuario)