from django.db import models

# Create your models here.
class Tbl_User(models.Model):
	User_Name    				=models.CharField(max_length=300,default='')
	User_Password				=models.CharField(max_length=50,default='')
	User_Email					=models.CharField(max_length=300,default='')
	User_Address				=models.CharField(max_length=300,default='')
	User_District				=models.CharField(max_length=20,default='')
	User_Phone					=models.CharField(max_length=20,default='')
	User_Type					=models.CharField(max_length=20,default='')
	User_Status					=models.CharField(max_length=20,default='')

	def __str__(self):
		return self.User_Name



class Tbl_Doctor(models.Model):
	Dctr_Name    				=models.CharField(max_length=300,default='')
	Dctr_Password				=models.CharField(max_length=50,default='')
	Dctr_Email					=models.CharField(max_length=300,default='')
	Dctr_Phone					=models.CharField(max_length=300,default='')
	Dctr_Department				=models.CharField(max_length=300,default='')
	Dctr_Place					=models.CharField(max_length=300,default='')
	Dctr_Photo                  =models.ImageField(upload_to = 'images/')
	Dctr_Fee					=models.CharField(max_length=300,default='')
	Type						=models.CharField(max_length=300,default='')
	Dctr_Time					=models.CharField(max_length=300,default='')





class Tbl_Shops(models.Model):
	Shop_Name    				=models.CharField(max_length=300,default='')
	Shop_Password				=models.CharField(max_length=50,default='')
	Shop_Email					=models.CharField(max_length=300,default='')
	Shop_Phone					=models.CharField(max_length=300,default='')
	Shop_License				=models.CharField(max_length=300,default='')
	Shop_Status					=models.CharField(max_length=300,default='')
	Shop_Place					=models.CharField(max_length=300,default='')
	Shop_Type					=models.CharField(max_length=300,default='')




class Tbl_Product(models.Model):
	Pro_Shop_ID                 =models.ForeignKey(Tbl_Shops,on_delete=models.CASCADE, blank=True,null=True)
	Pro_Name    				=models.CharField(max_length=300,default='')
	Pro_Code   					=models.CharField(max_length=300,default='')
	Pro_Description  			=models.CharField(max_length=300,default='')
	Pro_Image                  	=models.ImageField(upload_to = 'product/')
	Pro_Price   				=models.CharField(max_length=300,default='')
	Pro_Qty   					=models.CharField(max_length=300,default='')



class Tbl_Appointment(models.Model):
	App_Doctor_ID               =models.ForeignKey(Tbl_Doctor,on_delete=models.CASCADE, blank=True,null=True)
	App_User_ID                	=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	App_Time   					=models.CharField(max_length=300,default='')
	App_Date   					=models.CharField(max_length=300,default='')
	App_Link   					=models.CharField(max_length=300,default='')
	App_Status  				=models.CharField(max_length=300,default='')
	App_List                  	=models.ImageField(upload_to = 'userss/',default='')







	 			
class Tbl_cart(models.Model):
	buyer_id               		=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	seller_id                 	=models.ForeignKey(Tbl_Shops,on_delete=models.CASCADE, blank=True,null=True)
	art_id            			=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE, blank=True,null=True)
	Order_Date   				=models.CharField(max_length=300,default='')
	total						=models.CharField(max_length=300,default='')
	Order_Status   				=models.CharField(max_length=300,default='')
	status   					=models.CharField(max_length=300,default='')
	quantity   					=models.CharField(max_length=300,default='')
	Order_Price   				=models.CharField(max_length=300,default='')
	Staff_Email   				=models.CharField(max_length=300,default='')
	Order_Payment_Status   				=models.CharField(max_length=300,default='')
	




class Tbl_Staff(models.Model):
	Staff_User_ID               =models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	Staff_Shop_ID                =models.ForeignKey(Tbl_Shops,on_delete=models.CASCADE, blank=True,null=True)
	Staff_Product_ID            =models.ForeignKey(Tbl_Product,on_delete=models.CASCADE, blank=True,null=True)
	Staff_Name    				=models.CharField(max_length=300,default='')
	Staff_Password				=models.CharField(max_length=50,default='')
	Staff_Email					=models.CharField(max_length=300,default='')
	Staff_Phone					=models.CharField(max_length=300,default='')
	Staff_Type					=models.CharField(max_length=300,default='')

class Tbl_Enquiry(models.Model):
	Name    				=models.CharField(max_length=300,default='')
	MobileNumber			=models.CharField(max_length=50,default='')
	Email					=models.CharField(max_length=300,default='')
	Message					=models.CharField(max_length=300,default='')



# class Tbl_cart(models.Model):
# 	buyer_id 			=models.ForeignKey(Tbl_User,on_delete=models.CASCADE,default='')
# 	art_id 				=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE,default='')
# 	seller_id 			=models.ForeignKey(Tbl_Shops,on_delete=models.CASCADE)
# 	quantity 			=models.CharField(max_length=30,default='')
# 	total 				=models.CharField(max_length=30,default='')
# 	status 				=models.CharField(max_length=10,default='0')
# 	Order_Date   				=models.CharField(max_length=300,default='')
# 	Order_Status   				=models.CharField(max_length=300,default='')
# 	Order_Payment_Status   		=models.CharField(max_length=300,default='')
# 	Staff_Email   				=models.CharField(max_length=300,default='')


class order_tb(models.Model):
	user_id 			=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	product_id 			=models.CharField(max_length=30,default='')
	payment 			=models.CharField(max_length=30,default='')
	date 				=models.CharField(max_length=100,default='')
	time 				=models.CharField(max_length=100,default='')
	total 				=models.CharField(max_length=30,default='')
	payment_status 		=models.CharField(max_length=30,default='')
	status 				=models.CharField(max_length=30,default='')
	cart_id 			=models.CharField(max_length=30,default='')
	unit_id 			=models.CharField(max_length=30,default='')
	
class order_item_tb(models.Model):
	order_id 			=models.ForeignKey(order_tb,on_delete=models.CASCADE)
	user_id 			=models.ForeignKey(Tbl_User,on_delete=models.CASCADE)
	product_id 			=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE)
	unit_id 			=models.ForeignKey(Tbl_Shops,on_delete=models.CASCADE)
	cart_id 			=models.ForeignKey(Tbl_cart,on_delete=models.CASCADE)
	total 				=models.CharField(max_length=30,default='')
	date 				=models.CharField(max_length=100,default='')
	time 				=models.CharField(max_length=100,default='')
	payment_status 		=models.CharField(max_length=30,default='')
	worker_email 		=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')