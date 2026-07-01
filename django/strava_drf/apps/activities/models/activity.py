from django.db import models

class Activity(models.Model):
    strava_id = models.BigIntegerField(
        unique=True,
        help_text="ID da atividade no Strava",
    )
    name = models.CharField(
        max_length=255,
        help_text="Nome da atividade",
    )
    distance = models.FloatField(
        help_text="Distância em metros",
    )
    moving_time = models.PositiveIntegerField(
        help_text="Tempo em movimento (segundos)",
    )
    sport_type = models.CharField(
        max_length=50,
        help_text="Tipo de esporte (Run, Walk, Ride, etc)",
    )
    start_date = models.DateTimeField(
        help_text="Data/hora de início (UTC)",
    )
    average_speed = models.FloatField(
        null=True,
        blank=True,
        help_text="Velocidade média (m/s)",
    )

    created_at = models.DateTimeField(
        auto_now_add=True,
    )

    class Meta:
        ordering = ["-start_date"]
        verbose_name = "Atividade"
        verbose_name_plural = "Atividades"

    def __str__(self) -> str:
        return f"{self.name} - {self.distance / 1000:.2f} km"