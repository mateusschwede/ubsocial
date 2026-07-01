from django.db import models

class Loft(models.Model):
    title = models.CharField(max_length=50)
    description = models.CharField(max_length=255)
    address = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.title