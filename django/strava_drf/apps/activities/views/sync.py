from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from apps.activities.services.strava import fetch_activities
from apps.activities.models.activity import Activity


class ActivitySyncView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        activities_data = fetch_activities()

        created = 0
        skipped = 0

        for item in activities_data:
            activity, was_created = Activity.objects.get_or_create(
                strava_id=item["id"],
                defaults={
                    "name": item.get("name"),
                    "distance": item.get("distance"),
                    "moving_time": item.get("moving_time"),
                    "sport_type": item.get("sport_type"),
                    "start_date": item.get("start_date"),
                    "average_speed": item.get("average_speed"),
                },
            )

            if was_created:
                created += 1
            else:
                skipped += 1

        return Response(
            {
                "created": created,
                "skipped": skipped,
                "total": created + skipped,
            },
            status=status.HTTP_201_CREATED,
        )