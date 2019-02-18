module V1
  class StudentSerializer < ActiveModel::Serializer
    attributes :id, :images, :created_at, :updated_at, :grade, :university, :department, :address, :phone_number, :first_name, :last_name, :introduction
  end
end