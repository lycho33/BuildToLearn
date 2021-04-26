class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :mentor

  has_many :comments #???????
end
