class User < ApplicationRecord
    has_many :roles 
    has_many :lessons, through: :roles

    has_many :discusses
    has_many :lessons, through: :discusses 

      #create 2 helpers find_by user_id for student/mentor

      #build this after MVP

    has_secure_password
end
