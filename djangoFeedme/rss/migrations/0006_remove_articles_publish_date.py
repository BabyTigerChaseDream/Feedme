# Generated by Django 3.2 on 2021-04-25 00:41

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('rss', '0005_remove_articles_retrieve_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='articles',
            name='publish_date',
        ),
    ]
