# == Schema Information
#
# Table name: profiles
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  carrier    :text(65535)
#  skill      :text(65535)
#  license    :text(65535)
#  appear     :text(65535)
#  status     :integer
#  twitter    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ApplicationRecord
  belongs_to :user
end
