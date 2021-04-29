from django.contrib import admin
from django.urls import re_path
from . import views

app_name = 'rss'

urlpatterns = [
    re_path(r'^$', views.rss_list, name='list'),
    re_path(r'^(?P<slug>[\w-]+)/$', views.rss_detail, name='detail'),
    re_path(r'^article$', views.article_list, name='article'),

]
