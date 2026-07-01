import django_filters
from apps.activities.models.activity import Activity

class ActivityFilter(django_filters.FilterSet):
    min_distance = django_filters.NumberFilter(
        field_name="distance",
        lookup_expr="gte",
        help_text="Distância mínima em metros",
    )

    sport_type = django_filters.CharFilter(
        field_name="sport_type",
        lookup_expr="iexact",
    )

    class Meta:
        model = Activity
        fields = [
            "sport_type",
            "min_distance",
        ]