
from rest_framework import serializers
from apps.activities.models.activity import Activity

class ActivitySerializer(serializers.ModelSerializer):
    distance_km = serializers.SerializerMethodField()

    class Meta:
        model = Activity
        fields = [
            "id",
            "strava_id",
            "name",
            "distance",
            "distance_km",
            "moving_time",
            "sport_type",
            "start_date",
            "average_speed",
            "created_at",
        ]

    def get_distance_km(self, obj: Activity) -> float:
        return round(obj.distance / 1000, 2)