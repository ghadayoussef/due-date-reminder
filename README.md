# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.3 & Rails version 8.0.2

Steps to run the project:
* generate .env file in the main directory and copy paste env.sample in it and fill it with your database credentials and sender email    credentials

* bundle install

* rails db:setup

* rails db:seed

* rails server

* to test the emails manually and immediately run rails c and choose a user from the database having 
- send_due_date_reminder set to true
- time_zone matching your time zone (example: Africa/Cairo)
- due_date_reminder_time set to the current_time of utc (example: 12:27:00 is equivalent to 15:27:00 for cairo time)
- due_date_reminder_interval set to 0 (so yu can recieve the emails immediately)
- make sure the tickets table has one or more record with assigned_user_id = your selected user and due_date must be the current day (example: 2025-06-27)
- in rails c run: SendDueDateRemindersJob.perform_now the emails will arrive immediately


