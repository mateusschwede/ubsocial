from django.db.models import Count, Sum, Avg
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from apps.activities.models.activity import Activity


class ActivityStatsView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        queryset = Activity.objects.all()

        # Filtro opcional por sport_type
        sport_type = request.query_params.get("sport_type")
        if sport_type:
            queryset = queryset.filter(sport_type__iexact=sport_type)

        total_activities = queryset.count()

        aggregates = queryset.aggregate(
            total_distance=Sum("distance"),
            average_distance=Avg("distance"),
            total_moving_time=Sum("moving_time"),
        )

        by_sport_type = (
            queryset.values("sport_type")
            .annotate(total=Count("id"))
            .order_by("-total")
        )

        return Response(
            {
                "total_activities": total_activities,
                "total_distance_km": round((aggregates["total_distance"] or 0) / 1000, 2),
                "average_distance_km": round((aggregates["average_distance"] or 0) / 1000, 2),
                "total_moving_time_minutes": round((aggregates["total_moving_time"] or 0) / 60, 1),
                "by_sport_type": {
                    item["sport_type"]: item["total"] for item in by_sport_type
                },
            }
        )
