# Generated by Django 3.0.2 on 2020-01-12 16:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_members'),
    ]

    operations = [
        migrations.AddField(
            model_name='members',
            name='user_id',
            field=models.IntegerField(default=int),
            preserve_default=False,
        ),
    ]
