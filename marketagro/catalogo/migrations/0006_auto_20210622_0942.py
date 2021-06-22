# Generated by Django 3.2 on 2021-06-22 13:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalogo', '0005_auto_20210621_2229'),
    ]

    operations = [
        migrations.AddField(
            model_name='productos',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='images/'),
        ),
        migrations.AddField(
            model_name='productos',
            name='url',
            field=models.URLField(default='', max_length=100),
        ),
        migrations.AddField(
            model_name='proveedor',
            name='contraseña',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='proveedor',
            name='username',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='usuario',
            name='contraseña',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='usuario',
            name='username',
            field=models.CharField(max_length=20, null=True),
        ),
    ]