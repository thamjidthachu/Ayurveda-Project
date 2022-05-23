from django.shortcuts import render
from .models import *
from django.contrib.auth import logout
from django.http import HttpResponse, HttpResponseRedirect
from django.core.files.storage import FileSystemStorage
import datetime
from django.db.models import Sum
from django.http import JsonResponse
from django.core.mail import send_mail
from django.conf import settings
from django.template.loader import render_to_string
from django.views.decorators.cache import cache_control
from django.utils.datastructures import MultiValueDictKeyError

from datetime import date


def index(request):
    return render(request, 'index.html')


def aboutus(request):
    return render(request, 'about.html')


def contact(request):
    return render(request, 'contact.html')


def enquiry(request):
    if request.method == "POST":
        Name = request.POST["Name"]
        Email = request.POST["Email"]
        MobileNumber = request.POST["MobileNumber"]
        Message = request.POST["Message"]
        a = Tbl_Enquiry(Name=Name, Email=Email, MobileNumber=MobileNumber, Message=Message)
        a.save()
        return render(request, 'contact.html')


# ==============================ADMIN++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["pass"]
        Superadmin = Tbl_User.objects.filter(User_Email=email, User_Password=password, User_Type="Admin")
        Doctor = Tbl_Doctor.objects.filter(Dctr_Email=email, Dctr_Password=password, Type="Doctor")
        Shops = Tbl_Shops.objects.filter(Shop_Email=email, Shop_Password=password, Shop_Status="Approved")
        Staff = Tbl_Staff.objects.filter(Staff_Email=email, Staff_Password=password, Staff_Type="Staff")

        if Superadmin:
            for x in Superadmin:
                request.session['id'] = x.id
            return render(request, 'Admin/headerfooter.html', {'success': 'Succesfully LogedIn'})
        elif Doctor:
            for x in Doctor:
                request.session['id'] = x.id
            return render(request, 'doctor/headerfooter.html', {'success': 'Succesfully LogedIn'})
        elif Shops:
            for x in Shops:
                request.session['id'] = x.id
            return render(request, 'shops/headerfooter.html', {'success': 'Succesfully Login'})
        elif Staff:
            for x in Staff:
                request.session['id'] = x.id
            return render(request, 'staff/headerfooter.html', {'success': 'Succesfully Login'})
        else:
            return render(request, 'login.html', {'error': 'Invalid login credentials.!'})
    else:
        return render(request, 'login.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_doctor(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            Dctr_Name = request.POST["name"]
            Dctr_Email = request.POST["email"]
            Dctr_Password = request.POST["password"]
            Dctr_Phone = request.POST["phone"]
            Dctr_Place = request.POST["district"]
            Dctr_Department = request.POST["department"]
            Dctr_Photo = request.FILES["image"]
            var = Tbl_Doctor.objects.all().filter(Dctr_Email=Dctr_Email)
            if var:
                return render(request, 'admin/add_doctor.html', {'error': 'Email ID already existed'})
            else:

                a = Tbl_Doctor(Type="Doctor", Dctr_Photo=Dctr_Photo, Dctr_Name=Dctr_Name, Dctr_Email=Dctr_Email,
                               Dctr_Password=Dctr_Password, Dctr_Phone=Dctr_Phone, Dctr_Place=Dctr_Place,
                               Dctr_Department=Dctr_Department)
                a.save()
                subject = 'AyurExpert'
                message = render_to_string('shops/email_msg.html', {'user': Dctr_Email, 'psw': Dctr_Password, })
                email_from = settings.EMAIL_HOST_USER
                recipient_list = [Dctr_Email, ]
                send_mail(subject, message, email_from, recipient_list)
                return render(request, 'admin/add_doctor.html', {'success': 'Succesfully Added'})

        else:
            return render(request, 'admin/add_doctor.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_doctor(request):
    var = Tbl_Doctor.objects.all()
    return render(request, 'admin/view_doctor.html', {'db': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_users(request):
    var = Tbl_User.objects.all().filter(User_Type="User")
    return render(request, 'admin/view_users.html', {'db': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def shop_reg(request):
    if request.method == "POST":
        Shop_Name = request.POST["name"]
        Shop_Email = request.POST["email"]
        Shop_Password = request.POST["password"]
        Shop_Phone = request.POST["phone"]
        Shop_Place = request.POST["district"]
        Shop_License = request.POST["License"]
        var = Tbl_Shops.objects.all().filter(Shop_Email=Shop_Email)
        if var:
            return render(request, 'shop_register.html', {'error': 'EmailId already existed'})
        else:

            a = Tbl_Shops(Shop_License=Shop_License, Shop_Place=Shop_Place, Shop_Phone=Shop_Phone,
                          Shop_Status="Pending", Shop_Name=Shop_Name, Shop_Email=Shop_Email,
                          Shop_Password=Shop_Password)
            a.save()
            text = """<script>alert('Successfully Booked');window.location='/shop_reg/';</script> """
            return HttpResponse(text)
    else:
        return render(request, 'shop_register.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def shop_list(request):
    return render(request, 'admin/shop_reg.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def remove_doctor(request):
    if request.session.has_key('id'):
        ii = request.GET['id']
        var = Tbl_Doctor.objects.all().filter(id=ii).delete()
        return HttpResponseRedirect('/view_doctor/')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_shops(request):
    if request.session.has_key('id'):
        var = Tbl_Shops.objects.all().filter(Shop_Status="Pending")
        var1 = Tbl_Shops.objects.all().filter(Shop_Status="Approved")
        var2 = Tbl_Shops.objects.all().filter(Shop_Status="Rejected")
        var_count = Tbl_Shops.objects.all().filter(Shop_Status="Pending").count()
        var1_count = Tbl_Shops.objects.all().filter(Shop_Status="Approved").count()
        var2_count = Tbl_Shops.objects.all().filter(Shop_Status="Rejected").count()
        return render(request, 'admin/view_shops.html',
                      {'db': var, 'db1': var1, 'db2': var2, 'var_count': var_count, 'var1_count': var1_count,
                       'var2_count': var2_count})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def approve_shops(request):
    if request.session.has_key('id'):

        ii = request.GET['id']
        var = Tbl_Shops.objects.all().filter(id=ii).update(Shop_Status="Approved")
        var1 = Tbl_Shops.objects.all().filter(id=ii)
        for x in var1:
            email = x.Shop_Email
            psw = x.Shop_Password
        subject = 'Ayurvedha Expert'
        message = f'Hi , thank you for registering.you got approval from admin.and your password is :{psw}'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email, ]
        print("mail sent")
        send_mail(subject, message, email_from, recipient_list)
        return HttpResponseRedirect('/view_shops/')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def reject_shops(request):
    if request.session.has_key('id'):

        ii = request.GET['id']
        var = Tbl_Shops.objects.all().filter(id=ii).update(Shop_Status="Rejected")
        var1 = Tbl_Shops.objects.all().filter(id=ii)
        for x in var1:
            email = x.Shop_Email
            psw = x.Shop_Password
        subject = 'Ayurvedha Expert'
        message = f'Hi ,  you are rejected'
        email_from = settings.EMAIL_HOST_USER
        recipient_list = [email, ]
        send_mail(subject, message, email_from, recipient_list)
        return HttpResponseRedirect('/view_shops/')


# ==========================SHOPS=====================================================
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def allocate_order_works(request):
    if request.session.has_key('id'):
        if request.method == 'POST':
            print("__________inside post____________")
            widd = request.GET["id"]
            worker = request.POST["worker"]
            var = Tbl_cart.objects.all().filter(id=widd).update(Staff_Email=worker, Order_Status="Processing")
            return HttpResponseRedirect('/view_orders/')

    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_orders(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var = Tbl_cart.objects.all().filter(seller_id=ii, Order_Status="Ordered")
        var1 = Tbl_cart.objects.all().filter(seller_id=ii, Order_Status="accepted")
        var3 = Tbl_cart.objects.all().filter(seller_id=ii, Order_Status="finished")

        arr = []
        arr.append(var)
        print("__________", arr)
        var2 = Tbl_Staff.objects.all().filter(Staff_Shop_ID=ii)
        return render(request, 'shops/view_orders.html', {'var': var, 'ob': var2, 'var1': var1, 'var3': var3})
    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_products(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            Pro_Name = request.POST["name"]
            Pro_Code = request.POST["code"]
            Pro_Description = request.POST["description"]
            Pro_Price = request.POST["price"]
            Pro_Qty = request.POST["qty"]
            Pro_Image = request.FILES["image"]
            shid = request.session['id']
            qid = Tbl_Shops.objects.all().get(id=shid)
            a = Tbl_Product(Pro_Shop_ID=qid, Pro_Name=Pro_Name, Pro_Code=Pro_Code, Pro_Description=Pro_Description,
                            Pro_Price=Pro_Price, Pro_Qty=Pro_Qty, Pro_Image=Pro_Image)
            a.save()
            return render(request, 'shops/add_products.html', {'success': 'Succesfully LogedIn'})

        else:
            return render(request, 'shops/add_products.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_staffs(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            Staff_Name = request.POST["sname"]
            Staff_Password = request.POST["password"]
            Staff_Email = request.POST["email"]
            Staff_Phone = request.POST["contact"]
            shid = request.session['id']
            var = Tbl_Staff.objects.all().filter(Staff_Email=Staff_Email)
            if var:
                return render(request, 'shops/add_staff.html', {'error': 'Already registered Email ID'})
            else:

                qid = Tbl_Shops.objects.all().get(id=shid)
                a = Tbl_Staff(Staff_Shop_ID=qid, Staff_Name=Staff_Name, Staff_Password=Staff_Password,
                              Staff_Email=Staff_Email, Staff_Phone=Staff_Phone)
                a.save()
                subject = 'AyurExpert'
                message = render_to_string('shops/email_msg.html', {'user': Staff_Email, 'psw': Staff_Password, })
                email_from = settings.EMAIL_HOST_USER
                recipient_list = [Staff_Email, ]
                send_mail(subject, message, email_from, recipient_list)

                return render(request, 'shops/add_staff.html', {'success': 'Succesfully Added'})

        else:
            return render(request, 'shops/add_staff.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_products(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var2 = Tbl_Product.objects.all().filter(Pro_Shop_ID=ii)
        return render(request, 'shops/view_products.html', {'var2': var2})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_staffs(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var2 = Tbl_Staff.objects.all().filter(Staff_Shop_ID=ii)
        return render(request, 'shops/view_staffs.html', {'var2': var2})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def profile_shops(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var = Tbl_Shops.objects.all().filter(id=ii)
        return render(request, 'shops/profile.html', {'var': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_reportss(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var = Tbl_cart.objects.all().filter(id=ii)
        return render(request, 'shops/view_reports.html', {'var': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def edit_profile(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            ii = request.session['id']
            Shop_Name = request.POST["Shop_Name"]
            Shop_Place = request.POST["Shop_Place"]
            Shop_Email = request.POST["Shop_Email"]
            Shop_Phone = request.POST["Shop_Phone"]
            Shop_License = request.POST["Shop_License"]
            a = Tbl_Shops.objects.all().filter(id=ii).update(Shop_Name=Shop_Name, Shop_Place=Shop_Place,
                                                             Shop_Email=Shop_Email, Shop_Phone=Shop_Phone,
                                                             Shop_License=Shop_License)
            return HttpResponseRedirect('/profile_shops/')

        else:
            ii = request.session['id']
            var = Tbl_Shops.objects.all().filter(id=ii)
            return render(request, 'shops/edit_profile.html', {'db': var})


# =============================Doctor=====================================
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def doctor_profile(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var = Tbl_Doctor.objects.all().filter(id=ii)
        return render(request, 'doctor/profile.html', {'var': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def edit_doctor_profile(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            ii = request.session['id']
            Dctr_Name = request.POST["Dctr_Name"]
            Dctr_Place = request.POST["Dctr_Place"]
            Dctr_Email = request.POST["Dctr_Email"]
            Dctr_Phone = request.POST["Dctr_Phone"]
            Dctr_Department = request.POST["Dctr_Department"]
            Dctr_Password = request.POST["Dctr_Password"]
            Dctr_Fee = request.POST["Dctr_Fee"]
            Dctr_Time = request.POST["Dctr_Time"]

            a = Tbl_Doctor.objects.all().filter(id=ii).update(Dctr_Fee=Dctr_Fee, Dctr_Time=Dctr_Time,
                                                              Dctr_Password=Dctr_Password,
                                                              Dctr_Department=Dctr_Department, Dctr_Name=Dctr_Name,
                                                              Dctr_Place=Dctr_Place, Dctr_Email=Dctr_Email,
                                                              Dctr_Phone=Dctr_Phone)
            return HttpResponseRedirect('/doctor_profile/')

        else:
            ii = request.session['id']
            var = Tbl_Doctor.objects.all().filter(id=ii)
            return render(request, 'doctor/edit_profile.html', {'db': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def consulting(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            ii = request.session['id']
            Dctr_Time = request.POST["Dctr_Time"]
            Dctr_Fee = request.POST["Dctr_Fee"]
            a = Tbl_Doctor.objects.all().filter(id=ii).update(Dctr_Time=Dctr_Time, Dctr_Fee=Dctr_Fee)
            return HttpResponseRedirect('/doctor_profile/')

        else:
            ii = request.session['id']
            var = Tbl_Doctor.objects.all().filter(id=ii)
            return render(request, 'doctor/time.html')


def view_appointment(request):
    ii = request.session['id']
    var = Tbl_Appointment.objects.all().filter(App_Doctor_ID=ii)
    var1 = Tbl_Appointment.objects.all().filter(App_Doctor_ID=ii, App_Link="Approved").count()
    var2 = Tbl_Appointment.objects.all().filter(App_Doctor_ID=ii, App_Link="Not Availabe").count()

    return render(request, 'doctor/view_appointment.html', {'var': var, 'var1': var1, 'var2': var2})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def approve_appointment(request):
    if request.session.has_key('id'):
        ii = request.GET["id"]
        fromform = Tbl_Appointment.objects.all().filter(id=ii).update(App_Link="Approved")
        return HttpResponseRedirect('/view_appointment/')
    else:
        return render(request, 'doctor/view_appointment.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def reject_appointment(request):
    if request.session.has_key('id'):
        ii = request.GET["id"]
        fromform = Tbl_Appointment.objects.all().filter(id=ii).update(App_Status="Not Availabe")
        return HttpResponseRedirect('/view_appointment/')
    else:
        return render(request, 'doctor/view_appointment.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_link(request):
    if request.session.has_key('id'):
        if request.method == "POST":

            idd = request.POST["idd"]
            linkk = request.POST["linkss"]
            fromform = Tbl_Appointment.objects.all().filter(id=idd).update(App_Link=linkk, App_Status="Avialable")
            # return render(request,'doctor/add_link.html')

            return HttpResponseRedirect('/view_appointment/')
        else:
            idd = request.GET["id"]
            return render(request, 'doctor/add_link.html', {'idd': idd})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def add_prescription(request):
    if request.session.has_key('id'):
        if request.method == "POST":

            idd = request.POST["idd"]
            # Photoss=request.FILES['Photoss']
            # print("fffffff photo ffffffffff",Photoss)

            doc = request.FILES
            doc_name = doc['Photoss']
            fs = FileSystemStorage()
            path = "userss/%s" % doc_name.name
            filename = fs.save(path, doc_name)
            # var = Tbl_Applications.objects.all().filter(
            #     Apl_Std_ID=SessionId).update(Apl_Statement=filename,Apl_Status="pending")

            fromform = Tbl_Appointment.objects.all().filter(id=idd).update(App_List=filename, App_Status="Completed")
            # return render(request,'doctor/add_link.html')

            # 			try:
            # #         image_r=request.FILES['image']
            # 				image_r=request.FILES['Photoss']
            # 				fs = FileSystemStorage()
            # 				file = fs.save(image_r.name, image_r)
            # 			except MultiValueDictKeyError :
            # 				# file=Tbl_Appointment.objects.get(id=idd).App_List
            # 				# print("111111111111111111",file)
            # 				fromform=Tbl_Appointment.objects.all().filter(id=idd).update(App_List=file)

            # services.objects.filter(id=dataid).update(sname=sname_r,descr=descr_r,price=price_r,bname=bname_r,image=file)

            return HttpResponseRedirect('/view_appointment/')
        else:
            iddd = request.GET["id"]
            return render(request, 'doctor/add_prescription.html', {'iddd': iddd})


# ======================================staff================================


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_work(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        print("_________###########_____________", ii)
        var1 = Tbl_Staff.objects.all().filter(id=ii)
        for x in var1:
            Email = x.Staff_Email
        var = Tbl_cart.objects.all().filter(Staff_Email=Email, Order_Status="Processing")

        return render(request, 'staff/view_work.html', {'db': var})
    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_processingwork(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        print("_________###########_____________", ii)
        var1 = Tbl_Staff.objects.all().filter(id=ii)
        for x in var1:
            Email = x.Staff_Email
        var = Tbl_cart.objects.all().filter(Staff_Email=Email, Order_Status="accepted")

        return render(request, 'staff/view_processing_work.html', {'db': var})
    else:
        return render(request, 'index.html')


def accept_worrk(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        print("_________###########_____________", ii)
        aa = request.GET["id"]

        var1 = Tbl_Staff.objects.all().filter(id=ii)
        for x in var1:
            Email = x.Staff_Email
        var = Tbl_cart.objects.all().filter(id=aa, Staff_Email=Email, Order_Status="Processing").update(
            Order_Status="accepted")
        return HttpResponseRedirect('/view_processingwork/')
    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def finish_work(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        print("_________###########_____________", ii)
        aa = request.GET["id"]

        var1 = Tbl_Staff.objects.all().filter(id=ii)
        for x in var1:
            Email = x.Staff_Email
        var = Tbl_cart.objects.all().filter(id=aa, Staff_Email=Email, Order_Status="accepted").update(
            Order_Status="finished")
        return HttpResponseRedirect('/view_finishedwork/')
    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def view_finishedwork(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var1 = Tbl_Staff.objects.all().filter(id=ii)
        for x in var1:
            Email = x.Staff_Email
        var = Tbl_cart.objects.all().filter(Staff_Email=Email, Order_Status="finished")

        return render(request, 'staff/view_finished_work.html', {'db': var})
    else:
        return render(request, 'index.html')


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def staff_profile(request):
    if request.session.has_key('id'):
        ii = request.session['id']
        var = Tbl_Staff.objects.all().filter(id=ii)
        return render(request, 'staff/profile.html', {'var': var})


@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def staff_eprofile(request):
    if request.session.has_key('id'):

        if request.method == "POST":
            ii = request.session['id']
            S_Name = request.POST["S_Name"]
            S_Email = request.POST["S_Email"]
            S_Phone = request.POST["S_Phone"]
            S_Password = request.POST["S_Password"]
            a = Tbl_Staff.objects.all().filter(id=ii).update(Staff_Name=S_Name, Staff_Email=S_Email,
                                                             Staff_Password=S_Password, Staff_Phone=S_Phone)
            return HttpResponseRedirect('/staff_profile/')

        else:
            ii = request.session['id']
            var = Tbl_Doctor.objects.all().filter(id=ii)
            return render(request, 'staff/edit_profile.html', {'db': var})


def main_home(request):
    return render(request, 'service/main_home.html')


def users_registration(request):
    if request.method == "POST":
        name = request.POST.get("name")
        email = request.POST.get("email")
        phone = request.POST.get("mobile_Number")
        User_District = request.POST.get("User_District")
        User_Address = request.POST.get("User_Address")
        password = request.POST.get("password")

        chk = Tbl_User.objects.all().filter(User_Email=email)
        if chk:
            return render(request, 'service/reg.html', {'error': 'already registered email address'})

        else:
            a = Tbl_User(User_Name=name, User_Password=password, User_Email=email,
                         User_Phone=phone, User_Type="User"
                         , User_District=User_District, User_Address=User_Address)
            a.save()
            text = """<script>alert('Successfully Registered');window.location='/users_login/';</script> """
            return HttpResponse(text)
            # return render(request,'service/login.html')

    else:
        return render(request, 'service/reg.html')


def users_login(request):
    if request.method == "POST":
        email = request.POST["email"]
        password = request.POST["password"]
        chk = Tbl_User.objects.filter(User_Email=email, User_Password=password, User_Type="User")

        if chk:
            for x in chk:
                request.session['id'] = x.id
            return render(request, 'service/index.html')
        else:
            return render(request, 'service/login.html')
    else:
        return render(request, 'service/login.html')


def index_pass(request):
    return render(request, 'service/index.html')


def s_logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/users_login/')


def view_profile(request):
    ii = request.session['id']
    var = Tbl_User.objects.all().filter(id=ii)
    return render(request, 'service/view_profile.html', {'db': var})


def edit_user_profile(request):
    if request.method == "POST":
        name = request.POST.get("name")
        address = request.POST.get("address")
        district = request.POST.get("district")

        phone = request.POST.get("mobile_Number")
        password = request.POST.get("password")
        idd = request.session['id']
        chk = Tbl_User.objects.all().filter(id=idd).update(User_Password=password,
                                                           User_Name=name, User_Phone=phone, User_Address=address,
                                                           User_District=district)
        return HttpResponseRedirect('/view_profile/')
    else:
        ii = request.session['id']
        var = Tbl_User.objects.all().filter(id=ii)

        return render(request, 'service/edit_profile.html', {'db': var})


def doctor_list(request):
    var = Tbl_Doctor.objects.all()
    return render(request, 'service/view_doctor.html', {'var': var})


def book_doctor(request):
    if request.method == "POST":
        ii = request.session['id']
        doctor_idd = request.POST['doctor_idd']
        user_id = Tbl_User.objects.get(id=ii)
        doc_id = Tbl_Doctor.objects.get(id=doctor_idd)
        time = request.POST["time"]
        booking_date = request.POST["date"]

        from datetime import date
        today = date.today()
        print("Today date is: ", today)

        a = Tbl_Appointment(App_Doctor_ID=doc_id, App_User_ID=user_id, App_Date=booking_date,
                            App_Time=time)
        a.save()
        text = """<script>alert('Successfully Booked');window.location='/my_booking/';</script> """
        return HttpResponse(text)
    else:
        doctor_idd = request.GET['id']
        return render(request, 'service/booking.html', {'doctor_idd': doctor_idd})


def my_booking(request):
    ii = request.session['id']
    var = Tbl_Appointment.objects.all().filter(App_User_ID=ii)

    return render(request, 'service/view_booking.html', {'var': var})


def list_products_user(request):
    var = Tbl_Product.objects.all()
    return render(request, 'service/list_products_user.html', {'var': var})


def product_detail_view(request):
    if request.session.has_key('id'):
        pid = request.GET['id']
        var = Tbl_Product.objects.all().filter(id=pid)
        return render(request, 'service/product_detail_view.html', {'var': var})
    else:
        return render(request, 'service/product_detail_view.html')


def add_to_cart(request):
    if request.session.has_key('id'):
        aa = request.GET['id']
        print(aa)
        pid = Tbl_Product.objects.get(id=aa)
        ii = request.session['id']
        uid = Tbl_User.objects.get(id=ii)
        quantity = request.GET["number"]
        print(quantity)
        unitid = int(pid.Pro_Shop_ID.id)
        print("__________________________", unitid)
        unid = Tbl_Shops.objects.get(id=unitid)
        x = datetime.datetime.now()
        date = x.strftime("%d %B %Y")

        aq = int(pid.Pro_Qty)
        qu = int(quantity)

        if (aq < qu):
            return render(request, 'service/product_detail_view.html', {'error': "Requested Quantity is Not Available"})
        else:
            proprice = (pid.Pro_Price)
            total = int(proprice) * int(quantity)
            var = Tbl_cart(buyer_id=uid, art_id=pid, seller_id=unid, quantity=quantity,
                           total=total, status="unpaid",
                           Order_Date=date, Order_Status="Ordered", Order_Payment_Status="Pending")
            print("-----", var)
            var.save()
            text = """<script>alert('Successfully Booked');window.location='/cart/';</script> """
            return HttpResponse(text)
    else:
        return render(request, 'login.html')


def my_orderss(request):
    ii = request.session['id']
    var = Tbl_cart.objects.all().filter(buyer_id=ii)
    return render(request, 'service/view_my_cart.html', {'var': var})


def cart(request):
    if request.session.has_key('id'):
        ii = request.session["id"]
        tid = Tbl_cart.objects.all().filter(buyer_id=ii, status="unpaid")
        print("_____________________________", tid)
        sum1 = 0
        for x in tid:
            a = x.total
            sum1 = sum1 + int(a)
            print(sum1)
        return render(request, 'service/buyer_cart_page.html', {'tid': tid, 'sum': sum1})
    else:
        return render(request, 'login.html')


def delete_cart(request):
    if request.session.has_key('id'):
        uu = request.session["id"]
        ii = request.GET["id"]
        print("--------ii=====", ii)
        tid = Tbl_cart.objects.all().filter(id=ii, buyer_id=uu)
        print("------------------------tid----------------", tid)
        tid.delete()
        return HttpResponseRedirect('/cart/')
    else:
        return render(request, 'Buyer/login.html')


def cart_product_payment(request):
    if request.session.has_key('id'):
        if request.method == "POST":
            ii = request.session["id"]
            proid = Tbl_cart.objects.all().filter(buyer_id=ii, status="unpaid")
            print("--------session---", ii)
            uid = Tbl_User.objects.get(id=ii)
            amount = request.POST["subtotal"]
            print("--------amount---", amount)
            import datetime

            current_date = date.today()
            now = datetime.datetime.now()
            current_time = now.strftime("%H:%M:%S")
            arr = []
            arr1 = []
            arr2 = []
            for x in proid:
                arr.append(x.art_id.id)
                arr1.append(x.id)
                arr2.append(x.seller_id.id)
            a = order_tb(cart_id=arr1, unit_id=arr2, user_id=uid, product_id=arr, payment=amount, date=current_date,
                         time=current_time, payment_status="paid", status="pending")
            a.save()

            print(arr)
            arr.pop()
            var = order_tb.objects.latest("id")
            print("_--------------------------", var)

            for x in proid:
                b = x.art_id.id
                c = x.seller_id.id
                d = x.id
                p = x.art_id.Pro_Price
                pp = int(p)
                pid = Tbl_Product.objects.get(id=b)
                unid = Tbl_Shops.objects.get(id=c)
                cid = Tbl_cart.objects.get(id=d)

                c = order_item_tb(cart_id=cid, unit_id=unid, order_id=var, user_id=uid, product_id=pid, total=amount,
                                  date=current_date, time=current_time, payment_status="paid", status="pending")
                c.save()
            proid = Tbl_cart.objects.all().filter(buyer_id=ii).update(status="paid")
            return HttpResponseRedirect('/payment/')
    else:
        return render(request, 'login.html')


def payment(request):
    if request.session.has_key('id'):
        if request.method == "POST":
            return HttpResponseRedirect('/my_orderss/')
        else:
            ii = request.session["id"]
            user = Tbl_User.objects.all().filter(id=ii)
            # amount=request.POST["subtotal"]
            # print("_____________",amount)
            return render(request, 'service/buyer_payment.html', {'db': user})
    else:
        return render(request, 'login.html')


def buyer_orders(request):
    ii = request.session['id']
    var = Tbl_cart.objects.all().filter(buyer_id=ii, Order_Status='Ordered')
    var1 = Tbl_cart.objects.all().filter(buyer_id=ii, Order_Status='processing')
    var2 = Tbl_cart.objects.all().filter(buyer_id=ii, Order_Status='finished')
    # var=var1&var2
    return render(request, 'service/buyer_all_orders.html', {'var': var, 'var1': var1, 'var2': var2})


def doctt(request):
    return render(request, 'service/doctt.html')


def prooo(request):
    return render(request, 'service/proddd.html')
