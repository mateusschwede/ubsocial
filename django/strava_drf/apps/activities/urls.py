from django.urls import path
from rest_framework.routers import DefaultRouter
from apps.activities.views.activity import ActivityViewSet
from apps.activities.views.sync import ActivitySyncView
from apps.activities.views.strava_auth import StravaCallbackView
from apps.activities.views.stats import ActivityStatsView

router = DefaultRouter()
router.register(r"activities", ActivityViewSet, basename="activities")

urlpatterns = [
    path("activities/sync/", ActivitySyncView.as_view(), name="activities-sync"),
    path("stats/activities/", ActivityStatsView.as_view(), name="activities-stats"),
    path("strava/callback/", StravaCallbackView.as_view(), name="strava-callback"),
]

urlpatterns += router.urls