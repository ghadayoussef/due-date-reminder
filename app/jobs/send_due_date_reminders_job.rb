class SendDueDateRemindersJob < ApplicationJob
  queue_as :default

  def perform(repeat = false)
    Rails.logger.info "[SendDueDateRemindersJob] Triggered by Sidekiq schedule"
    User.where(send_due_date_reminder: true).find_each do |user|
      Time.use_zone(user.time_zone) do
        now = Time.zone.now
        due_at = user.due_date_reminder_time
        next unless due_at.hour == now.hour && due_at.min == now.min

        due_date = Date.current + user.due_date_reminder_interval.days
        tickets = user.assigned_tickets.where(due_date: due_date)

        tickets.each do |ticket|
          Rails.logger.info("found a ticket")
          ReminderMailer.due_soon_reminder(user, ticket).deliver_later
          PushNotificationService.send_due_reminder(user, ticket)
        end
      end
    end
    # used if you are triggering the SendDueDateRemindersJob from the trigger action in reminders_controller.rb
    # comment this condition if sidekiq_scheduler is calling SendDueDateRemindersJob
    if repeat
      self.class.set(wait: 1.minute).perform_later(repeat: true)
    end
  end
end
