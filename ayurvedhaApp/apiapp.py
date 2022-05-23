from django.shortcuts import get_object_or_404
from rest_framework .response import Response
from rest_framework .views import APIView
from rest_framework import status
from .serializers import user_tbSerializer,DoctorSerializer,ProductSerializer,AppointmentSerializer
from .models import Tbl_User,Tbl_Doctor,Tbl_Product,Tbl_Appointment,Tbl_Shops
from django.views.decorators.csrf import csrf_exempt
from django.core.serializers.json import DjangoJSONEncoder
import datetime


#function for user registration
class user_reg(APIView):
	data={}	
	def post(self,request):
		if request.method=="POST":
			User_Name=request.POST.get("User_Name")
			User_Password=request.POST.get("User_Password")
			User_Email=request.POST.get("User_Email")
			User_Address=request.POST.get("User_Address")
			User_District=request.POST.get("User_District")
			User_Phone=request.POST.get("User_Phone")

			if Tbl_User.objects.filter(User_Email=User_Email).exists():
				data={'status':'false','message':'E-mail already exists'}
				return Response(data)
			else:
				serializer=Tbl_User(User_Status="True",User_Name=User_Name,User_Password=User_Password,User_Email=User_Email,User_Address=User_Address,User_District=User_District,User_Phone=User_Phone,User_Type="User")
				serializer.save()
				data={'status':'true','message':'Thankyou for registration '}
				return Response(data)

#function for view appointment by user
class view_booking(APIView):
# http://192.168.0.147:5000/view_booking/	
	def post(self,request):
		if request.method=="POST":
			App_User_ID=request.POST.get("User_ID")
			user_id=int(App_User_ID)

			uid=Tbl_User.objects.all().get(id=user_id)


			db=Tbl_Appointment.objects.all().filter(App_User_ID=uid) 
			print(db)
			data={}
			for x in db:
				doctor={}
				# doct_list=[]
				doc=Tbl_Doctor.objects.get(id=x.App_Doctor_ID.id)
				print("1111111111111111",doc)
				doctor["Dctr_Name"]=doc.Dctr_Name
				doctor["Dctr_Department"]=doc.Dctr_Department
				doctor["Dctr_Fee"]=doc.Dctr_Fee
				# doct_list.append(doctor)

				data["App_Date"]=x.App_Date
				data["id"]=x.id

				data["App_Time"]=x.App_Time
				data["App_Link"]=x.App_Link
				data["Dctr_Name"]=doc.Dctr_Name
				data["Dctr_Department"]=doc.Dctr_Department
				data["Dctr_Fee"]=doc.Dctr_Fee
				

			print(data)
			# serializer = AppointmentSerializer(db,many=True)
			# print("1111111111111111",serializer)
			# print("111111111 data 1111111",serializer.data)

			return Response(data)
#function for user login
class user_login(APIView):
	data={}
	def post(self,request):
		if request.method=="POST":
			User_Email=request.POST.get("User_Email")
			print(User_Email)
			User_Password=request.POST.get("User_Password")
			print(User_Password)
			chk=Tbl_User.objects.filter(User_Email=User_Email,User_Password=User_Password)
			print(chk)
			for x in chk:
				idd=x.id
			res=Tbl_User.objects.filter(id=idd,User_Email=User_Email,User_Password=User_Password)
			serializer_user = user_tbSerializer(res,many=True)
			data={'data':serializer_user.data}
			return Response(data)			

#function for view of doctor
class doctor_list(APIView):
    def get(self,request):
        doctordb =Tbl_Doctor.objects.all()
        serializer = DoctorSerializer(doctordb,many=True)
        print("serializer",serializer)
        return Response(serializer.data)
#function for view products
class product_list(APIView):
    def get(self,request):
        doctordb =Tbl_Product.objects.all()
        serializer = ProductSerializer(doctordb,many=True)
        print("serializer",serializer)
        return Response(serializer.data)

#function for doctor appointment
class booking(APIView):
	data={}
	def post(self,request):
		if request.method=="POST":
			App_Time=request.POST.get("App_Time")
			App_Date=request.POST.get("App_Date")
			App_Doctor_ID=request.POST.get("App_Doctor_ID")
			doctor_id=int(App_Doctor_ID)
			App_User_ID=request.POST.get("App_User_ID")
			user_id=int(App_User_ID)
			did=Tbl_Doctor.objects.all().get(id=doctor_id)
			uid=Tbl_User.objects.all().get(id=user_id)
			serializer=Tbl_Appointment(App_Time=App_Time,App_Date=App_Date,App_Doctor_ID=did,App_User_ID=uid)

			serializer.save()
			data={'status':'success'}
			return Response(data)


#view_prescription
class view_prescription(APIView):
	data={}
	def post(self,request):
		if request.method=="POST":
			useid=request.POST.get("User_ID")
			user_id=int(useid)
			uid=Tbl_User.objects.all().get(id=user_id)
			db=Tbl_Appointment.objects.all().filter(App_User_ID=uid) 
			serializer = AppointmentSerializer(db,many=True)
			print("serializer",serializer)
			return Response(serializer.data)

				
#function for oredering product
class order_product(APIView):
	data={}
	def post(self,request):
		if request.method=="POST":
			order_id=request.POST.get("product_id")
			o_id=int(order_id)
			print("type",type(o_id))

			order_price=request.POST.get("order_price")
			order_qty=request.POST.get("order_qty")
			order_total=request.POST.get("order_total")
			# total=order_qty*order_total
			# payment_status=request.POST.get("payment_status")
			x=datetime.datetime.now()
			date=x.strftime("%d %B %Y")

			shop_id=request.POST.get("shop_id")
			s_id=int(shop_id)

			user_id=request.POST.get("user_id")
			u_id=int(user_id)

			pid=Tbl_Product.objects.all().get(id=o_id) 
			uid=Tbl_User.objects.all().get(id=u_id)
			s_id=Tbl_Shops.objects.all().get(id=s_id)

			serializer=Tbl_Order(Order_Price=order_price,
Order_Qty=order_qty,Order_Date=date,Order_Total=order_total,
Order_Status="Ordered",Order_Payment_Status="Pending",Order_User_ID=uid,Pro_Shop_ID=s_id,Order_Product_ID=pid)

			serializer.save()
			data={'status':'success'}
			return Response(data)
	