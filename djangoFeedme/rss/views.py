from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from .models import Rss,Articles
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from . import forms
from . import RssParser as RP

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
    paginator = Paginator(article_list, 25) # Show 25 articles per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 
                'rss/article_list.html',
                {
                    'article_list':article_list,
                    'page_obj': page_obj
                }
            )

def article_list(request):
    article_list = Articles.objects.all().order_by('publish_date')
    paginator = Paginator(article_list, 25) # Show 25 articles per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 
                'rss/article_list.html',
                {
                    'article_list':article_list,
                    'page_obj': page_obj
                }
            )

#@login_required(login_url="/accounts/login")
def article_retrieve(request):
    # retrieve article from RSS source
    rss_list = Rss.objects.all().order_by('title')
    for r in rss_list:
        try:
            RF=RP.RSSFeed(url=r.link)
            RF.get_articles()
            RF.save_all()
        except Exception as e:
            print(e) 

        article_list = Articles.objects.all().order_by('publish_date')
        paginator = Paginator(article_list, 25) # Show 25 articles per page.
        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        return render(request, 
                    'rss/article_list.html',
                    {
                        'article_list':article_list,
                        'page_obj': page_obj
                    }
                )

@login_required(login_url="/accounts/login")
def rss_create(request):
    if request.method=='POST':
        form = forms.CreateRss(request.POST)
        if form.is_valid():
            # save rss to DB
            instance = form.save(commit=False)
            instance.owner = request.user
            instance.save()
            return redirect('rss:list')
    else:
        form = forms.CreateRss()
    return render(request, 'rss/rss_create.html', {'form':form})

