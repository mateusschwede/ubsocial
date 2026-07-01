from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from apps.activities.models.activity import Activity
from apps.activities.serializers.activity import ActivitySerializer
from apps.activities.filters.activity import ActivityFilter

class ActivityViewSet(ReadOnlyModelViewSet):
    queryset = Activity.objects.all()
    serializer_class = ActivitySerializer
    permission_classes = [IsAuthenticated]
    filterset_class = ActivityFilter

    @action(detail=False, methods=["get"], url_path="long")
    def long_activities(self, request):
        queryset = self.get_queryset().filter(distance__gt=5000)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    
    @action(detail=False, methods=["get"], url_path="walk")
    def walk_activities(self, request):
        queryset = self.get_queryset().filter(sport_type__iexact="Walk")
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)