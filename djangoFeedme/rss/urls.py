from django.contrib import admin
from django.urls import re_path
from . import views

urlpatterns = [
    re_path(r'^$', views.rss_list),
    re_path(r'^article$', views.article_list),

]
