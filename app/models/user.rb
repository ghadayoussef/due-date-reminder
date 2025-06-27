class User < ApplicationRecord
  self.table_name = 'users'

  has_many :assigned_tickets, class_name: 'Ticket', foreign_key: :assigned_user_id
  validates :email, presence: true, uniqueness: true
end
