# Generated by Django 3.2 on 2021-06-23 17:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('catalogo', '0007_auto_20210623_1238'),
    ]

    operations = [
        migrations.AddField(
            model_name='region',
            name='comuna',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='catalogo.comuna'),
        ),
    ]
