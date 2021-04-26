class User < ApplicationRecord
    has_one :mentor #look up has_one
    has_one :student #look up doc
    
    
    # has_many :discusses
    # has_many :lessons, through: :discusses

      #create 2 helpers find_by user_id for student/mentor

      #build this after MVP

    has_secure_password
end
