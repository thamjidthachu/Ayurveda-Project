from rest_framework import serializers
from . models import Tbl_User,Tbl_Doctor,Tbl_Product,Tbl_Appointment

class user_tbSerializer(serializers.ModelSerializer):
	class Meta:
		model=Tbl_User
		fields='__all__'

class DoctorSerializer(serializers.ModelSerializer):
    
  class Meta:
      model = Tbl_Doctor
      fields ='__all__'


class ProductSerializer(serializers.ModelSerializer):
    
  class Meta:
      model = Tbl_Product
      fields ='__all__'


class AppointmentSerializer(serializers.ModelSerializer):
    
  class Meta:
      model = Tbl_Appointment
      fields ='__all__'