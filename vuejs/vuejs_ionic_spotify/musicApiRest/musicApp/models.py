from django.db import models

class Music(models.Model):
    title = models.CharField(max_length=100)
    artist = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.title} - {self.artist}"