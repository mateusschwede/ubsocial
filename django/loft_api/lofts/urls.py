from rest_framework.routers import DefaultRouter
from .views import LoftViewSet

router = DefaultRouter()
router.register(r'lofts', LoftViewSet, basename='loft')

urlpatterns = router.urls