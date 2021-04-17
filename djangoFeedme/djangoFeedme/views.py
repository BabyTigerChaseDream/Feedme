from django.http import HttpResponse
from django.shortcuts import render

def homepage(request):
    return render(request, 'homepage.html')
    #return HttpResponse("Home Page")

def rss(request):
    return render(request, 'rss.html')
    #return HttpResponse("Hello rss")