from django.shortcuts import render

# Create your views here.

############ MODELS #################

from .models import Accounts
from .models import Members


############ FORMS #################

# Accounts
from main.forms import LoginForm
from main.forms import RegisterForm


from main.forms import MemberForm
from main.forms import DeleteMemberForm


############ IMPORTS #################

from django.shortcuts import render, redirect

# Create your views here.
from django.http import HttpResponse, HttpResponseRedirect

from django.db import connections
from django.urls import reverse

from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


from django.contrib.auth.hashers import make_password, check_password

from time import gmtime, strftime, mktime

import locale

from django.db.models import Sum,Q
from django.db.models import Count

import re

import stripe

import datetime

from dateutil.relativedelta import relativedelta
from django.http import Http404
from dateutil import relativedelta as rdelta
import pandas as pd

from django.core.mail import send_mail, send_mass_mail
from django.core.mail import EmailMessage
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import FileSystemStorage


import shutil

from django.conf import settings
from pathlib import Path
from Crypto.Cipher import XOR
import base64
import os

import hashlib

import requests

import json

from django.db.models import Avg, F, Max, Min, Window

import random


############################# ERROR HANDLING #############################

def handler404(request, exception):
	return render(request, 'error.html', status=404)

def handler500(request):
	return render(request, 'error.html', status=500)

def handler400(request, exception):
	return render(request, 'error.html', status=400)

def handler401(request):
	return render(request, 'error.html', status=401)

def handler403(request, exception):
	return render(request, 'error.html', status=403)

def handler503(request):
	return render(request, 'error.html', status=503)


############################# VIEW #############################

def member(request, id):

	session_exist = check_session_exist(request)
	message = None

	if 'user_id' not in request.session:
		return HttpResponseRedirect(reverse('login'))

	session_user_id = request.session['user_id']
	
	member = (Members.objects.filter(id=id))
	if len(member) == 0:
		return HttpResponseRedirect(reverse('index'))

	else:
		member = member[0]

	if request.method == "POST":
		if 'delete_btn' in request.POST:
			Members.objects.filter(id=id).delete()
			return HttpResponseRedirect(reverse('index'))


	return render(      
					request, 
					'member.html', 
					{
						"session_exist":session_exist,
						"message":message,
						"id":id,
						"member":member,
						"session_user_id":session_user_id,
					}
				)


def index(request):

	session_exist = check_session_exist(request)
	message = None

	if 'user_id' not in request.session:
		return HttpResponseRedirect(reverse('login'))

	session_user_id = request.session['user_id']

	members = Members.objects.all().order_by('-averagescore')

	members_avgs_mean = Members.objects.aggregate(Avg('averagescore'))
	members_avgs_max = Members.objects.aggregate(Max('averagescore'))
	members_avgs_min = Members.objects.aggregate(Min('averagescore'))

	members_wins_mean = Members.objects.aggregate(Avg('wins'))
	members_wins_max = Members.objects.aggregate(Max('wins'))
	members_wins_min = Members.objects.aggregate(Min('wins'))

	members_losses_mean = Members.objects.aggregate(Avg('losses'))
	members_losses_max = Members.objects.aggregate(Max('losses'))
	members_losses_min = Members.objects.aggregate(Min('losses'))

	members_highestscore_mean = Members.objects.aggregate(Avg('highestscore'))
	members_highestscore_max = Members.objects.aggregate(Max('highestscore'))
	members_highestscore_min = Members.objects.aggregate(Min('highestscore'))

	recent_submission = Members.objects.aggregate(Max('date'))

	if request.method == "POST":

		if 'delete_btn' in request.POST:

			MyDeleteMemberForm = DeleteMemberForm(request.POST)
			  
			if MyDeleteMemberForm.is_valid():
				delete_id = MyDeleteMemberForm.cleaned_data['delete_id']

				Members.objects.filter(id=delete_id).delete()

				return HttpResponseRedirect(reverse('index'))
				
			else:
				MyDeleteMemberForm = DeleteMemberForm()


	return render(      
					request, 
					'index.html', 
					{
						"session_exist":session_exist,
						"message":message,
						"members":members,
						"members_avgs_mean":members_avgs_mean,
						"members_avgs_max":members_avgs_max,
						"members_avgs_min":members_avgs_min,

						"members_wins_mean":members_wins_mean,
						"members_wins_max":members_wins_max,
						"members_wins_min":members_wins_min,

						"members_losses_mean":members_losses_mean,
						"members_losses_max":members_losses_max,
						"members_losses_min":members_losses_min,

						"members_highestscore_mean":members_highestscore_mean,
						"members_highestscore_max":members_highestscore_max,
						"members_highestscore_min":members_highestscore_min,

						"recent_submission":recent_submission,

						"session_user_id":session_user_id,
					}
				)


def add(request):

	session_exist = check_session_exist(request)
	message = None

	if 'user_id' not in request.session:
		return HttpResponseRedirect(reverse('login'))

	session_user_id = request.session['user_id']


	if request.method == "POST":
		#Get the posted form
		MyMemberForm = MemberForm(request.POST)
	  
		if MyMemberForm.is_valid():
			fullname = MyMemberForm.cleaned_data['fullname']
			wins = MyMemberForm.cleaned_data['wins']
			losses = MyMemberForm.cleaned_data['losses']
			averagescore = MyMemberForm.cleaned_data['averagescore']
			highestscore = MyMemberForm.cleaned_data['highestscore']
			date = MyMemberForm.cleaned_data['date']
			location = MyMemberForm.cleaned_data['location']
			opponent = MyMemberForm.cleaned_data['opponent']
			contact = MyMemberForm.cleaned_data['contact']

			add_event = Members.objects.create(
				user_id=session_user_id,
				fullname=fullname,
				wins=wins,
				losses=losses,
				averagescore=averagescore,
				highestscore=highestscore,
				date=date,
				location=location,
				opponent=opponent,
				contact=contact,

			)
			add_event.save()

			return redirect( '/member/' + str(add_event.id) )
			
		else:
			message = "Something went wrong, please try again."
	else:
		MyMemberForm = MemberForm()

	return render(      
					request, 
					'add.html', 
					{
						"session_exist":session_exist,
						"message":message,
					}
				)


def edit(request, id):

	session_exist = check_session_exist(request)
	message = None

	if 'user_id' not in request.session:
		return HttpResponseRedirect(reverse('login'))

	session_user_id = request.session['user_id']

	member = (Members.objects.filter(id=id,user_id=session_user_id))
	if len(member) == 0:
		return HttpResponseRedirect(reverse('index'))

	else:
		member = member[0]

	if request.method == "POST":
		#Get the posted form
		MyMemberForm = MemberForm(request.POST)
	  
		if MyMemberForm.is_valid():
			fullname = MyMemberForm.cleaned_data['fullname']
			wins = MyMemberForm.cleaned_data['wins']
			losses = MyMemberForm.cleaned_data['losses']
			averagescore = MyMemberForm.cleaned_data['averagescore']
			highestscore = MyMemberForm.cleaned_data['highestscore']
			date = MyMemberForm.cleaned_data['date']
			location = MyMemberForm.cleaned_data['location']
			opponent = MyMemberForm.cleaned_data['opponent']
			contact = MyMemberForm.cleaned_data['contact']

			Members.objects.filter(id=id, user_id=session_user_id).update(
				fullname=fullname,
				wins=wins,
				losses=losses,
				averagescore=averagescore,
				highestscore=highestscore,
				date=date,
				location=location,
				opponent=opponent,
				contact=contact,
			)

			return redirect( '/member/' + str(id) )
			
		else:
			message = "Something went wrong, please try again."
	else:
		MyMemberForm = MemberForm()

	return render(      
					request, 
					'edit.html', 
					{
						"session_exist":session_exist,
						"message":message,
						"id":id,
						"member":member,
					}
				)


############################# ACCOUNT ###################################

def logout(request):
	try:
		del request.session['user_id']
	except:
		pass
	# return HttpResponseRedirect(reverse('index'))
	return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))

def register(request):

	if 'user_id' in request.session:
		return HttpResponseRedirect(reverse('index'))

	message = None
	session_exist = check_session_exist(request)
	date_submitted = strftime("%Y-%m-%d %H:%M:%S", gmtime())

	if request.method == "POST":
		#Get the posted form
		MyRegisterForm = RegisterForm(request.POST)
	  
		if MyRegisterForm.is_valid():
			email = MyRegisterForm.cleaned_data['email']
			password = MyRegisterForm.cleaned_data['password']

			password_encrypt = make_password(password, "generating_password", "pbkdf2_sha256")

			check_exist = len(Accounts.objects.filter(email=email))

			if(check_exist > 0):
				message = "This email already exist, please register with another email address."
			else:

				if re.match(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$', password):

					account_add_event = Accounts.objects.create(
						email=email,
						password=password_encrypt,
						date_submitted=date_submitted
					)
					account_add_event.save()

					request.session['user_id'] = account_add_event.id
					session_user_id = request.session['user_id']

					return HttpResponseRedirect(reverse('index'))

				else:
					message = "Your password must be 8 characters, one letter, one number and one special character"
		else:
			message = "Please fill in all parts of the form"
	else:
		MyRegisterForm = RegisterForm()


	return render(request, 'register.html', {
		"message" : message,
		"session_exist":session_exist,
		})


def login(request):

	if 'user_id' in request.session:
		return HttpResponseRedirect(reverse('index'))

	message = None
	session_exist = check_session_exist(request)
	session_user_id = None

	if request.method == "POST":
		#Get the posted form
		MyLoginForm = LoginForm(request.POST)
	  
		if MyLoginForm.is_valid():
			email = MyLoginForm.cleaned_data['email']
			password = MyLoginForm.cleaned_data['password']
			password_encrypt = False

			check_email_amount_query = len(Accounts.objects.filter(email=email))
			if(check_email_amount_query > 0):
				check_email_query = (Accounts.objects.get(email=email))
				password_encrypt = check_password(password, check_email_query.password)
			else:
				message = "This account does not exist"


			if(password_encrypt == True):
				check_exist_query = len(Accounts.objects.filter(email=email, password=password_encrypt))

				user_id_query = Accounts.objects.get(email=email)
				request.session['user_id'] = user_id_query.id
				session_user_id = request.session['user_id']

				return HttpResponseRedirect(reverse('index'))
			else:
				message = "Please login with your account details"
		else:
			message = "Please login with your account details"
	else:
		MyLoginForm = LoginForm()

	return render(request, 'login.html', {
		"message" : message, 
		"session_exist":session_exist,
		"session_user_id" : session_user_id,
		})


############################# OTHERS ###################################

def check_session_exist(request):

	session_exist = False

	if 'user_id' in request.session:
		session_exist = True

	return session_exist


