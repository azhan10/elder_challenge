# Generated by Django 3.0.2 on 2020-01-12 15:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='accounts',
            old_name='username',
            new_name='email',
        ),
    ]
