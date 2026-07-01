
from django.contrib import admin
from apps.activities.models.activity import Activity

@admin.register(Activity)
class ActivityAdmin(admin.ModelAdmin):
    list_display = (
        "name",
        "sport_type",
        "distance",
        "start_date",
        "created_at",
    )
    list_filter = ("sport_type",)
    search_fields = ("name",)
    ordering = ("-start_date",)