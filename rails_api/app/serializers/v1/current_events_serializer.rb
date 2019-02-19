module V1
  class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :date, :created_at, :updated_at
  end
end
  