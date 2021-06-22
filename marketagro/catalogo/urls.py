from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('Productos', views.catalogo, name='catalogo'),
    path('Ingresar', views.ingresar, name='ingresar'),
]