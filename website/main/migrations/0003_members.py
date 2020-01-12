# Generated by Django 3.0.2 on 2020-01-12 15:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0002_auto_20200112_1529'),
    ]

    operations = [
        migrations.CreateModel(
            name='Members',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fullname', models.TextField()),
                ('wins', models.IntegerField()),
                ('losses', models.IntegerField()),
                ('averagescore', models.IntegerField()),
                ('highestscore', models.IntegerField()),
                ('location', models.TextField()),
                ('opponent', models.TextField()),
                ('date', models.DateTimeField(verbose_name='date published')),
            ],
        ),
    ]
