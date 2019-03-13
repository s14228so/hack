module V1
  class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :content, :date, :created_at, :updated_at
  end
end
  