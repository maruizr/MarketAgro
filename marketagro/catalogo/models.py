from django import db
from django.db import models


# Create your models here.
class Categoria(models.Model):
    id_cate = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'categoria'
        
    def __str__(self):
        return self.name

class Proveedor(models.Model):
    rut = models.CharField(primary_key=True, max_length=9)
    nombre = models.CharField(max_length=150)
    apellido = models.CharField(max_length=150)
    apellido_m = models.CharField(max_length=150)
    nombre_tienda = models.CharField(max_length=50)
    direccion = models.CharField(max_length=150)
    username = models.CharField(max_length=30)
    contraseña = models.CharField(max_length=20)
    correo = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'proveedor'

    def __str__(self):
        return self.rut

class Tipo_producto(models.Model):
    id_tipo = models.IntegerField(primary_key=True)
    nom_tipo = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'tipo_producto'

    def __str__(self):
        return self.id_tipo

class Producto(models.Model):
    id_prod = models.IntegerField(primary_key=True)
    nom_prod = models.CharField(max_length=150)
    precio = models.CharField(max_length=8)
    categoria_id_cate = models.ForeignKey(Categoria, models.DO_NOTHING, db_column='categoria_id_cate')
    tipo_producto_id_tipo = models.ForeignKey(Tipo_producto, models.DO_NOTHING, db_column='tipo_producto_id_tipo')
    proveedor_rut = models.ForeignKey(Proveedor, models.DO_NOTHING, db_column='proveedor_rut')
    imagen = models.ImageField(upload_to="imagenes", null=True, blank=True)

    class Meta:
        managed = False
        db_table = 'producto'

    def __str__(self):
        return self.nom_prod

class Region(models.Model):
    id_region = models.IntegerField(primary_key=True)
    region = models.CharField(max_length=150)

    class Meta:
        managed = False
        db_table = 'region'

    def __str__(self):
        return self.id_region

class Comuna(models.Model):
    id_comu = models.IntegerField(primary_key=True)
    comuna = models.CharField(max_length=150)
    region_id_region = models.ForeignKey(Region, models.DO_NOTHING, db_column='region_id_region')

    class Meta:
        managed = False
        db_table = 'comuna'

    def __str__(self):
        return self.id_comu

class Usuario(models.Model):
    rut = models.CharField(primary_key=True, max_length=9)
    nombre = models.CharField(max_length=150)
    apellido = models.CharField(max_length=150)
    apellido_m = models.CharField(max_length=150)
    direccion = models.CharField(max_length=200)
    region_id_region = models.ForeignKey(Region, models.DO_NOTHING, db_column='region_id_region')
    comuna_id_comu = models.ForeignKey(Comuna, models.DO_NOTHING, db_column='comuna_id_comu')
    username = models.CharField(max_length=30)
    contraseña = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'usuario'

    def __str__(self):
        return self.rut

class Carro(models.Model):
    id_carro = models.IntegerField(primary_key=True)
    producto_id_prod = models.ForeignKey(Producto, models.DO_NOTHING, db_column='producto_id_prod')
    usuario_rut = models.ForeignKey(Usuario, models.DO_NOTHING, db_column='usuario_rut')
    total = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'carro'

    def __str__(self):
        return self.id_carro