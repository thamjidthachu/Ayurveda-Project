class view_booking(APIView):
	
	
	def post(self,request):
		result={}
		if request.method=="POST":
			App_User_ID=request.POST.get("User_ID")
			user_id=int(App_User_ID)
			uid=Tbl_User.objects.all().get(id=user_id)
			db=Tbl_Appointment.objects.all().filter(App_User_ID=uid)
			# for x in db:
			# 	doctor_id=x.App_Doctor_ID.id
			# 	doctor_name=x.App_Doctor_ID.Dctr_Name
			# 	doctor_dept=x.App_Doctor_ID.Dctr_Department
			# 	doctor_fee=x.App_Doctor_ID.Dctr_Fee
			# 	# doctor_photo=x.App_Doctor_ID.Dctr_Photo
			# 	date=x.App_Date
			# 	time=x.App_Time
			# 	bookind_id=x.id
			# 	link=x.App_Link
			# 	result["doctor_id"]=doctor_id
			# 	print("doctor id ",result["doctor_id"])

			# 	result["doctor_name"]=doctor_name
			# 	result["doctor_dept"]=doctor_dept
			# 	result["doctor_fee"]=doctor_fee
			# 	# result["doctor_photo"]=doctor_photo
			# 	# result["date"]=date
			# 	# result["time"]=time
			# 	# result["bookind_id"]=bookind_id
			# 	# result["link"]=link
			# 	# print("fsfdsfsfsfsfsf",result["link"])
			# return Response(result)
				
			serializer = AppointmentSerializer(db,many=True)
			return Response(serializer.data)