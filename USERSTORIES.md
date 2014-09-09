# User Stories

----
## User Types
* Admin
* Promoter
* Employee

----
## Features
* Promoter signs up with Facebook
* Promoter signs up with email
* Promoter edits profile (needs story)
* Promoter adds employees (needs story)
* Employee signs up (needs story)

----
# Stories

----
## Promoter signs up with Facebook
As a promoter, I want to be able to sign up for the website using my Facebook account.

###Usage:
1. On homepage, click "Promoter Sign Up"
2. Click "Sign Up With Facebook"
3. Promoter sees their profile page

###Acceptance Criteria
* Promoter is prompted with Facebook Sign Up page
* Promoter is saved to the database through the user model with:
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

###Acceptance Criteria
* Promoter sees sign up page
* Promoter enters valid input to create new user:
  * valid if email is not a duplicate
  * valid if email is an email
  * valid if passwords match
  * valid if photo is either empty or a photo link
* Promoter is saved to the database through the user model with:
  * Name
  * Email
  * Photo Link