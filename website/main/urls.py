from django.urls import path

from . import views

from django.conf.urls import url
from django.http import HttpResponse
from django.views.generic import TemplateView

from django.conf import settings
from django.conf.urls.static import static



urlpatterns = [
    path('', views.index, name='index'),

    path('login', views.login, name='login'),
    path('logout', views.logout, name='logout'),
    path('register', views.register, name='register'),


    path('member/<str:id>', views.member, name='member'),

    path('add', views.add, name='add'),
    path('edit/<str:id>', views.edit, name='edit'),
    
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


handler404 = views.handler404
handler500 = views.handler500
handler400 = views.handler400
handler401 = views.handler401
handler403 = views.handler403
handler503 = views.handler503
