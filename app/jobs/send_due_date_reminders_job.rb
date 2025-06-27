class SendDueDateRemindersJob < ApplicationJob
  queue_as :default

  def perform
    User.where(send_due_date_reminder: true).find_each do |user|
      Time.use_zone(user.time_zone) do
        now = Time.zone.now
        next unless user.due_date_reminder_time.hour == now.hour && user.due_date_reminder_time.min == now.min

        due_date = Date.current + user.due_date_reminder_interval.days
        tickets = user.assigned_tickets.where(due_date: due_date)

        tickets.each do |ticket|
          ReminderMailer.due_soon_reminder(user, ticket).deliver_now
          # PushNotificationService.send_due_reminder(user, ticket)
        end
      end
    end
  end
end
