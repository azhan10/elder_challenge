from django import forms


########### ACCOUNT ##########
class LoginForm(forms.Form):
	email = forms.CharField(max_length = 200)
	password = forms.CharField(widget = forms.PasswordInput())


class RegisterForm(forms.Form):
	email = forms.CharField()
	password = forms.CharField(widget = forms.PasswordInput())


########### OTHERS ##########
class MemberForm(forms.Form):
	fullname = forms.CharField(max_length = 200)
	wins = forms.CharField(max_length = 200)
	losses = forms.CharField(max_length = 200)
	averagescore = forms.CharField(max_length = 200)
	highestscore = forms.CharField(max_length = 200)
	location = forms.CharField()
	contact = forms.CharField()
	opponent = forms.CharField(max_length = 200)
	date = forms.CharField(max_length = 200)


class DeleteMemberForm(forms.Form):
	delete_id = forms.CharField()
	