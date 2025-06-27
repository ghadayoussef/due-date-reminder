class ReminderMailer < ApplicationMailer
  def due_soon_reminder(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: @user.email, subject: "Reminder: Ticket '#{ticket.title}' is due soon")
  end
end
