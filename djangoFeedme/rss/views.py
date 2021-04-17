from django.shortcuts import render

# Create your views here.

def rss_list(request):
    return render(request, 'rss/rss_list.html')
