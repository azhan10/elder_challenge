# Generated by Django 3.0.2 on 2020-01-12 18:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0004_members_user_id'),
    ]

    operations = [
        migrations.AddField(
            model_name='members',
            name='contact',
            field=models.TextField(default=str),
            preserve_default=False,
        ),
    ]
