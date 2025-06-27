# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 3.2.3 & Rails version 8.0.2

Steps to run the project:
* generate .env file in the main directory and copy paste env.sample in it and fill it with your database credentials and sender email    credentials

* bundle install

* rails db:setup or (rails db:create then rails db:migrate then rails db:seed)

in a terminal run:
* rails server

in another terminal run:
* bundle exec sidekiq

* Make sue there is at least a user from the database having 
- send_due_date_reminder set to true
- time_zone matching your time zone (example: Africa/Cairo)
- due_date_reminder_time set to the current_time or greater of utc (example: 12:27:00 is equivalent to 15:27:00 for cairo time)
- due_date_reminder_interval set to 0 (so you can recieve the emails within the current day)
- make sure the tickets table has one or more record with assigned_user_id = your selected user and due_date must be the current day (example:
2025-06-27)

* to test the emails manually and immediately run rails c and SendDueDateRemindersJob.perform_now the emails will arrive immediately

* to test the scheduled email you have two approaches: 
1 - Via api: go to this url http://localhost:4000/api/v1/reminders/trigger in postman and set the method to POST
2 - Via sidekiq scheduler:

    in config/sidekiq_test.yml
    rename sidekiq_test.yml to sidekiq.yml

    and

    in app/job/send_due_date_reminders_job.rb
    comment line 24 to 26
    if repeat
      self.class.set(wait: 1.minute).perform_later(repeat: true)
    end

* to run the rspec 
1 - run bundle exec sidekiq in a terminal
2 - and run bundle exec rspec in another terminal 



