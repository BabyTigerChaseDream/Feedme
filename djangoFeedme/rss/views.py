from django.shortcuts import render
from .models import Rss,Articles
from django.http import HttpResponse

# Create your views here.

def rss_list(request):
    rss_list = Rss.objects.all().order_by('title')
    return render(request, 
                  'rss/rss_list.html',
                  {'rss_list':rss_list}
            )
# https://docs.djangoproject.com/en/dev/ref/models/querysets/#regex
def rss_detail(request, slug):
    # TODO what if article_list is empty
    article_list = Articles.objects.filter(feedurl__icontains=slug)
    return render(request, 
                  'rss/article_list.html',
                  {'article_list':article_list}
            )

def article_list(request):
    article_list = Articles.objects.all().order_by('feedurl')
    return render(request, 
                  'rss/article_list.html',
                  {'article_list':article_list}
            )
