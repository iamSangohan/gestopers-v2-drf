from rest_framework import viewsets
from .serializers import DepartementSerializer, PersonnelSerializer
from .models import Departement, Personnel

# Create your views here.


class DepartementViewSet(viewsets.ModelViewSet):
    queryset = Departement.objects.all()
    serializer_class = DepartementSerializer

class PersonnelViewSet(viewsets.ModelViewSet):
    queryset = Personnel.objects.all()
    serializer_class = PersonnelSerializer