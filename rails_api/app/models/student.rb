class Student < ApplicationRecord
  include ActiveModel::Serialization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :update_access_token!
  
  validates :email, presence: true
  validates_numericality_of :grade, less_than_or_equal_to: 4

  has_many :event_students
  has_many :events, through: :event_students

  has_many_attached :images
  has_many :student_teams
  has_many :teams, through: :student_teams

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    save
  end
  
  # delegate :image, to: :image, allow_nil: true
end


