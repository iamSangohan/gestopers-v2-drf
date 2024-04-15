from django.urls import include, path
from rest_framework import routers
from .views import DepartementViewSet, PersonnelViewSet

# Write urls here


router = routers.DefaultRouter()
router.register(r'departements', DepartementViewSet)
router.register(r'personnel', PersonnelViewSet)

urlpatterns = [
    path('', include(router.urls)),
]