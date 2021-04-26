class Student < ApplicationRecord
  belongs_to :user

  has_many :lessons 
  has_many :mentors, through: :lessons 
end
