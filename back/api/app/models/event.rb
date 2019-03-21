class Event < ApplicationRecord
  has_many :event_students
  has_many :students, through: :event_students

  validates :title, presence: true
  validates :date, presence: true
  validates :content, presence: true
  belongs_to :company

   has_many_attached :images
end


