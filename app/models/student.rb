class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :event_students

  # def login
  #   if @student.present?
  #      return true
  #   else
  #      return false
  #   end
  # end
end
