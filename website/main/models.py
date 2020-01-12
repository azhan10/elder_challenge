from django.db import models

# Create your models here.

class Accounts(models.Model):
	email = models.TextField()
	password = models.TextField()
	date_submitted = models.DateTimeField('date published')


class Members(models.Model):
	user_id = models.IntegerField()
	fullname = models.TextField()
	wins = models.IntegerField()
	losses = models.IntegerField()
	averagescore = models.IntegerField()
	highestscore = models.IntegerField()
	location = models.TextField()
	contact = models.TextField()
	opponent = models.TextField()
	date = models.DateTimeField('date published')

