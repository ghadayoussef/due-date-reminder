class Ticket < ApplicationRecord
  belongs_to :assigned_user, foreign_key: :assigned_user_id, class_name: 'User', optional: false
end