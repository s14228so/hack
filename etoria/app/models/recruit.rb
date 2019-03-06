# == Schema Information
#
# Table name: recruits
#
#  id         :bigint(8)        not null, primary key
#  title      :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recruit < ApplicationRecord
  belongs_to :user
end
