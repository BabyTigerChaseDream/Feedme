from django.contrib import admin
from django.urls import re_path
from . import views

app_name = 'rss'

urlpatterns = [
    # order matters 
    re_path(r'^$', views.rss_list, name='list'),
    re_path(r'^create$', views.rss_create, name='create'),
    re_path(r'^(?P<slug>[\w-]+)/$', views.rss_detail, name='detail'),
    re_path(r'^article$', views.article_list, name='article'),

]
