class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :event_students
  has_many :events, through: :event_students

  has_many_attached :images
  has_many :student_teams
  has_many :teams, through: :student_teams
  
  # delegate :image, to: :image, allow_nil: true
end
