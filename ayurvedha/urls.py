"""ayurvedha URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include
from rest_framework.urlpatterns import format_suffix_patterns
from ayurvedhaApp import apiapp
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('ayurvedhaApp.urls')),


  
    # path('API/user_reg',csrf_exempt(apiapp.user_reg.as_view())),
  #   path('user_reg',csrf_exempt(apiapp.user_reg.as_view())),

  #   path('user_login',csrf_exempt(apiapp.user_login.as_view())),
 	# path('doctor_list',csrf_exempt(apiapp.doctor_list.as_view())),
  #   path('product_list',csrf_exempt(apiapp.product_list.as_view())),
  #   path('booking',csrf_exempt(apiapp.booking.as_view())),
  #   path('view_booking',csrf_exempt(apiapp.view_booking.as_view())),
  #   path('order_product',csrf_exempt(apiapp.order_product.as_view())),
  #   path('view_prescription',csrf_exempt(apiapp.view_prescription.as_view())),
    
    

    





    
   
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)