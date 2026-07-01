from rest_framework import viewsets
from .models import Loft
from .serializers import LoftSerializer

class LoftViewSet(viewsets.ModelViewSet):
    queryset = Loft.objects.all()
    serializer_class = LoftSerializer