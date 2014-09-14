# User Stories

----
## User Types
* Admin
* Promoter
* Employee

----
## Features
* Promoter signs up with Facebook (implemented)
* Promoter signs up with email (implemented)
* Promoter edits profile, company name 
* Promoter adds employees 
* Employee signs up with Facebook
* Employee signs up with email
* Promoter adds venue (implemented)
* Promoter adds concert with basic information (implemented)
* Promoter adds employee to a concert (needs story)
* Promoter adds expenses and incomes to a concert (needs story)
* Promoter adds ticket info to a concert (needs story)
* Promoter views dashboard
* Promoter views venue
* Promoter views concert
* Promoter/Employee runs show (needs story)

----
# Stories

----
## Promoter signs up with Facebook
As a promoter, I want to be able to sign up for the website using my Facebook account.

###Usage:
1. On homepage, click "Promoter Sign Up"
2. Click "Sign Up With Facebook"
3. Promoter sees their profile page

###Acceptance Criteria:
* Promoter is prompted with Facebook Sign Up page
* Promoter is saved to the database through the promoter model with:
  * Name
  * Email
  * Photo Link

----
## Promoter signs up with Email
As a promoter, I want to be able to sign up for the website using my Email.

###Usage:
1. On homepage, click "Promoter Sign Up"
2. Promoter enters email, password, password confirmation, and optionally adds a photo(link).
3. Promoter sees their profile page

###Acceptance Criteria:
* Promoter sees sign up page
* Promoter enters valid input to create new user:
  * validate if email is not a duplicate
  * validate if email is an email
  * validate if passwords match
  * validate if photo is either empty or a photo link
* Promoter is saved to the database through the promoter model with:
  * Name
  * Email
  * Photo Link

----
##Promoter adds employees
As a promoter, I want to be able to add/invite employees by entering their email.

###Usage:
1. On dashboard, click "Add Employee"
2. Promoter enters employee's email and clicks add
3. Promoter sees success message on dashboard

###Acceptance Criteria:
* Promoter sees add employee form within dashboard
* Promoter enters valid employee email and clicks add
* An email is sent to the employee
* Promoter sees a confirmation message

----
##Employee signs up with Facebook
As an employee, I want to sign up by following the email instructions. (with Facebook)

###Usage:
1. In email, click link to sign up.
2. On employee sign up confirmation page, employee enters promoter's code and confirms promoters name/company.
3. Employee clicks "Sign up with Facebook"
4. Employee sees their dashboard.

###Acceptance Criteria:
* Employee sees sign up confirmation page
* Employee enters correct code for promoter
* Employee signs up through facebook
* Employee is saved in database through the employee model:
  * Name
  * Email
  * Image(link)
  * Belonging to the promoter
* Employee sees confirmation 

----
##Employee signs up with Email
As an employee, I want to sign up by following the email instructions. (with Email)

###Usage:
1. In email, click link to sign up.
2. On employee sign up confirmation page, employee enters promoter's code and confirms promoters name/company.
3. Employee enters email, password, password confirmation, and optionally adds a photo(link).
4. Employee sees their dashboard.

###Acceptance Criteria:
* Employee sees sign up confirmation page
* Employee enters correct code for promoter
* Employee enters valid input for email sign up
* Employee is saved in database through the employee model:
  * Name
  * Email
  * Image(link)
  * Belonging to the promoter
* Employee sees confirmation 

----
##Promoter adds venue
As a promoter, I want to add a venue.

###Usage:
1. On dashboard, promoter clicks add venue.
2. Promoter enters venue name, address, and contact information.
3. Promoter clicks "Add Venue"

###Acceptance Criteria:
* Promoter has "Add Venue" button on dashboard. 
* Clicking "Add Venue" displays form within dashboard.
* Confirmation message and new venue is displayed on dashboard.

----
##Promoter adds concert - basic
As a promoter, I want to add a concert with minimal information.

###Usage:
1. On dashboard, Promoter clicks "Add Concert"
2. Promoter enters Headliner, Date, and Venue.
3. Promoter clicks "Add Concert".

###Acceptance Criteria:
* Promoter has "Add Concert" button on dashboard.
* Clicking "Add Concert" displays form within dashboard.
* Confirmation message and new concert is displayed on dashboard.

----
##Promoter views dashboard
As a promoter, I want to view my dashboard with all relevant informoation.

###Usage:
1. Click "Dashboard" from any page

###Accepatance Criteria:
* Promoter sees the following sections:
  * Upcoming concerts
    * Today's Concerts are highlighted
  * Employees
  * Venues
  * Stats
  * Promoter Info (photo, company name)

----
##Promoter views venue
As a promoter, I want to view a venue's information.

###Usage:
1. From dashboard, click on a venue.

###Acceptance Criteria:
* Promoter has saved venues.
* After clicking venue, promoter sees the following stats:
  * Name, Contact Info, Address

----
##Promoter views concert
As a promoter, I want to view a concert's information.

###Usage:
1. From dashboard, click on a concert.

###Acceptance Criteria:
* Promoter has saved concerts.
* After clicking a concert, promoter sees the following stats:
  * Headliner, Venue, Date