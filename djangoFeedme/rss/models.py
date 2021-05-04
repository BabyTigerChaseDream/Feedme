from django.db import models
from django.contrib.auth.models import User

# Note : each time changes made to this file , pls run 2 commands below :
# 1) python3 manage.py makemigrations
# 1) python3 manage.py migrate

# Create your models here.
class Rss(models.Model):
    title = models.CharField(max_length=20)
    #catalog = models.TextChoices('Tags','News Tech Blog')
    link = models.URLField()
    date = models.DateTimeField(auto_now_add=True)
    slug = models.SlugField()
    owner = models.ForeignKey(User, on_delete=models.CASCADE, default=None)


    def __str__(self):
        return self.title 

class Articles(models.Model):
    title = models.CharField(max_length=200)
    authors = models.CharField(max_length=100)
    description = models.TextField()
    link = models.URLField()
    publish_date = models.DateTimeField()
    feedurl = models.URLField()

    def __str__(self):
        return self.title 

