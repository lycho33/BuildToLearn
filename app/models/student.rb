class Student < ApplicationRecord
  belongs_to :user

  has_many :commented_lessons
  has_many :mentors, through: :lessons 
end
