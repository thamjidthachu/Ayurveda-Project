# Generated by Django 3.2.7 on 2022-01-25 04:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ayurvedhaApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='tbl_appointment',
            name='App_List',
            field=models.ImageField(default='', upload_to='userss/'),
        ),
    ]