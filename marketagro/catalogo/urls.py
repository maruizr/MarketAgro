from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('Productos', views.catalogo, name='catalogo'),
    path('Login', views.inicio_sesión, name='login'),
    path('Productos/Producto', views.form_cr_prod, name='form_cr_prod')
]