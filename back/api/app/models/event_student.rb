class EventStudent < ApplicationRecord
  belongs_to :student
  belongs_to :event
end
