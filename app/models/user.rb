class User < ApplicationRecord
  self.table_name = 'user'
  has_secure_password

  has_many :assigned_tickets, class_name: 'Ticket'
  validates :email, presence: true, uniqueness: true
end
