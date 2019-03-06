# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  body       :text(65535)
#  area       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  has_many :users
  has_many :blogs
  mount_uploader :image, ImageUploader
end
