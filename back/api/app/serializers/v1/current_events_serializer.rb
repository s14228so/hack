module V1
  class CurrentEventsSerializer < ActiveModel::Serializer
    attributes :id, :title, :date, :created_at, :updated_at
  end
end
  