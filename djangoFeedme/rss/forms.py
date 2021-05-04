from django import forms
from . import models

class CreateRss(forms.ModelForm):
    class Meta:
        model = models.Rss
        fields = ['title','link','slug']