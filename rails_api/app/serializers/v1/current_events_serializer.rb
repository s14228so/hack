module V1
  class CurrentEventsSerializer < ActiveModel::Serializer
    attributes :id, :title, :date
  end
end
