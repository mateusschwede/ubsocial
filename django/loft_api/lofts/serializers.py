from rest_framework import serializers
from .models import Loft

class LoftSerializer(serializers.ModelSerializer):
    class Meta:
        model = Loft
        fields = '__all__'