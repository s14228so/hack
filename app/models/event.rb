class Event < ApplicationRecord
  has_many :students, through: :event_students
  has_many :students
end
