# == Schema Information
#
# Table name: ideas
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Idea < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
end
