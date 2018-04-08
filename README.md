# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.3.1

* Database  - Sqlite

* Database initialization
	rake db:create
	rake db:migrate

* How to run the test suite
	rspec spec/


* Application behavior
	There are 3 types of users
	1. Customer
	2. Employee
	3. Manager

* Customer features
	1. View account details
	2. Last 10 transactions
	3. Deposit Amount
	4. Withdraw Amount

* Employee features are similar to customer as of now

* Manager feature
	1. All Customer features
	2. Can view all accounts
	3. Deposit/Withdraw in other's account
	4. Download CSV file of any account's transactions (there is no validation of date filters)

* User can have only Account
* There is no validation on amount as well means amount in an account can go negative
* There is no CSS on devise pages

* rake tasks
	1. rake users:create_user
	2. rake users:create_account
	3. rake users:create_transaction
