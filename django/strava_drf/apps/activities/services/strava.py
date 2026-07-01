import requests
from django.conf import settings

def fetch_activities(page: int = 1, per_page: int = 50) -> list[dict]:
    url = "https://www.strava.com/api/v3/athlete/activities"

    headers = {
        "Authorization": f"Bearer {settings.STRAVA_ACCESS_TOKEN}",
    }

    params = {
        "page": page,
        "per_page": per_page,
    }

    response = requests.get(url, headers=headers, params=params)
    response.raise_for_status()
    return response.json()