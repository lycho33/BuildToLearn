class Lesson < ApplicationRecord
  belongs_to :student
  belongs_to :mentor

  has_many :discuss
  has_many :users, through: :discuss
end
