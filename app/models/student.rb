class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :event_students
  has_one_attached :image
  # def login
  #   if @student.present?
  #      return true
  #   else
  #      return false
  #   end
  # end
  has_many :student_teams
  # delegate :image, to: :image, allow_nil: true
end
