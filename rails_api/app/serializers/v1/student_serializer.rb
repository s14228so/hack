module V1
  class StudentSerializer < ActiveModel::Serializer
    attributes :id, :email, :created_at, :updated_at
  end
end