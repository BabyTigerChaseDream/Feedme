from django.db import models

# Note : each time changes made to this file , pls run 2 commands below :
# 1) python3 manage.py makemigrations
# 1) python3 manage.py migrate

# Create your models here.
class Rss(models.Model):
    title = models.CharField(max_length=20)
    catalog = models.TextChoices('Tags','News Tech Blog')
    link =models.URLField()
    date = models.DateTimeField(auto_now_add=True)
    slug = models.SlugField()


    def __str__(self):
        return self.title 