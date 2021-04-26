class User < ApplicationRecord
    has_many :mentors
    has_many :students
    has_many :comments
    has_many :commented_lessons, through: :comments, source: :lesson 
end
