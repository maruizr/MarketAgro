from django.db.models.query import ValuesIterable
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('Productos', views.catalogo, name='catalogo'),
    path('Login', views.inicio_sesión, name='login'),
    path('Producto', views.form_cr_prod, name='form_cr_prod'),
    path('Producto/Create', views.create_prod, name="create_prod"),
    path('Usuario/Create', views.create_usuario, name="create_usuario"),
    path('Registro', views.registro, name='registro')

]