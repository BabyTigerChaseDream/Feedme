from django.shortcuts import render
from .models import Rss

# Create your views here.

def rss_list(request):
    rss_list = Rss.objects.all().order_by('title')
    return render(request, 
                  'rss/rss_list.html',
                  {'rss_list':rss_list}
                  )
