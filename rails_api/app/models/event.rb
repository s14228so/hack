class Event < ApplicationRecord
  has_many :event_students
  has_many :students, through: :event_students
end
