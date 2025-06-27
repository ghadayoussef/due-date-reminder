require 'faker'
require 'time'

puts "🌱 Seeding database..."

# Clear old data
Ticket.destroy_all
User.destroy_all

# Create users
users = []
3.times do |i|
  users << User.create!(
    name: "User #{i + 1}",
    email: "ghadayoussef00+#{i + 1}@gmail.com",
    send_due_date_reminder: [true, false].sample,
    due_date_reminder_interval: [0, 1, 2].sample,
    due_date_reminder_time: Time.parse("#{rand(8..16)}:00"),
    time_zone: ["UTC", "Europe/Vienna", "America/New_York", "Egypt/Cairo"].sample
  )
end

# Create tickets
10.times do
  Ticket.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph,
    assigned_user: users.sample,
    due_date: Date.today + rand(1..7).days,
    status_id: rand(1..3),
    progress: rand(0..100)
  )
end

puts "✅ Done seeding!"
