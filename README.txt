
INSTALLATION

*************Please follow the method below to run the code.**************

1) Create and run a virtual wrapper (must be Python 3)
	- virtualenv -p python3 envname
2) Install all libraries (pip install -r requirements.txt)
3) Migrate the db table (written in models.py)
	- python manage.py makemigrations
	- python manage.py migrate
4) Import SQL file to a MySQL database
	- elder.sql is the file to import
5) Run website: python manage.py runserver (when you're in the main directory)

There are 5 accounts made. All account password is "Member1@"



FEATURES
	- Account system (login, register and logout).
		- Password is encrypted.
	- Add, edit & delete member (data).
	- View statistics such as the max and mean of the average score.
	- View all information of a selected member.
	- Error checks are done which is displayed in a message.


ACCOUNT
	- Login with Email: member1@gmail.com, Password: Member1@
	- There is no different between accounts.


SPECIFICATION
	- Django (Python) - Version 3.0.2
	- MySQL
	- Bootstrap & Font Awesome
	- JavaScript & JQuery
	- HTML, CSS


DATABASE
	- The data contains 50 rows of members
	- The data contains 5 user accounts
	- The db table is located in the settings.py
		- The db table name is called 'elder'