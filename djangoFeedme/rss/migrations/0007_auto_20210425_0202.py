# Generated by Django 3.2 on 2021-04-25 02:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rss', '0006_remove_articles_publish_date'),
    ]

    operations = [
        migrations.AlterField(
            model_name='articles',
            name='authors',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='articles',
            name='title',
            field=models.CharField(max_length=200),
        ),
    ]
