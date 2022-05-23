from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from ayurvedhaApp import views
from django.contrib import admin
from django.urls import path,include
from rest_framework.urlpatterns import format_suffix_patterns
from ayurvedhaApp import apiapp
from django.views.decorators.csrf import csrf_exempt
urlpatterns = [
    path('',views.index),
    path('login/',views.login),
    path('logout/',views.logout),
    path('contact/',views.contact),
    path('enquiry/',views.enquiry),
    path('aboutus/',views.aboutus),

    # -----------------admin-------------------
    path('add_doctor/',views.add_doctor),
    path('view_doctor/',views.view_doctor),
    path('shop_reg/',views.shop_reg),
    path('shop_list/',views.shop_list),
    path('remove_doctor/',views.remove_doctor),
    path('view_users/',views.view_users),
    path('view_shops/',views.view_shops),
    path('approve_shops/',views.approve_shops),
    path('reject_shops/',views.reject_shops),

    # =====================shops============================
    path('add_products/',views.add_products),
    path('view_products/',views.view_products),
    path('profile_shops/',views.profile_shops),
    path('edit_profile/',views.edit_profile),
    path('add_staffs/',views.add_staffs),
    path('view_staffs/',views.view_staffs),
    path('view_orders/',views.view_orders),
    path('allocate_order_works/',views.allocate_order_works),
    path('view_reportss/',views.view_reportss),
     
# ======================doctor=========================
    path('doctor_profile/',views.doctor_profile),
    path('edit_doctor_profile/',views.edit_doctor_profile),
    path('consulting/',views.consulting),
    path('view_appointment/',views.view_appointment),
    path('reject_appointment/',views.reject_appointment),
    path('approve_appointment/',views.approve_appointment),
    path('add_link/',views.add_link),
    path('add_prescription/',views.add_prescription),

# =========================Staff======================

    path('view_work/',views.view_work),  
    path('view_processingwork/',views.view_processingwork),
    path('view_finishedwork/',views.view_finishedwork),  
    path('staff_profile/',views.staff_profile),  
    path('staff_eprofile/',views.staff_eprofile),  
    # path('accept_work/',views.accept_work),  
    path('main_home/',views.main_home), 
    path('users_registration/',views.users_registration),  
    path('users_login/',views.users_login),  
    path('s_logout/',views.s_logout), 
    path('view_profile/',views.view_profile), 
    path('index_pass/',views.index_pass), 
    path('edit_user_profile/',views.edit_user_profile), 
    path('doctor_list/',views.doctor_list), 
    path('book_doctor/',views.book_doctor), 
    path('my_booking/',views.my_booking), 
    path('list_products_user/',views.list_products_user), 
    path('product_detail_view/',views.product_detail_view), 
    path('add_to_cart/',views.add_to_cart), 
    path('my_orderss/',views.my_orderss), 
    path('cart/',views.cart), 
    path('cart_product_payment/',views.cart_product_payment), 
    path('delete_cart/',views.delete_cart), 
    path('payment/',views.payment), 
    path('buyer_orders/',views.buyer_orders), 
    path('doctt/',views.doctt), 
    path('prooo/',views.prooo), 
    path('accept_worrk/',views.accept_worrk), 
    path('finish_work/',views.finish_work), 
    









    # path('product_booking/',views.product_booking), 




    


   

]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL,document_root=settings.STATIC_ROOT)