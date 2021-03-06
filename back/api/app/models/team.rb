class Team < ApplicationRecord
  has_many :student_teams
  has_many :students, through: :student_teams

  validates :name, length: { maximum: 15 }
  validates :introduction, length: { maximum: 300 }
end
