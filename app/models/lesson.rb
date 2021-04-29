class Lesson < ApplicationRecord
  belongs_to :mentor, class_name: 'User', foreign_key: 'user_id'
 
  has_many :statuses 
  has_many :students, through: :statuses, source: :user

  has_many :discusses
  has_many :users, through: :discusses
end
