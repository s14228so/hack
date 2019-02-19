module V1
  class StudentSerializer < ActiveModel::Serializer
    attributes :id, :access_token, :nickname, :images, :created_at, :app,:updated_at, :grade, :university, :department, :address, :phone_number, :first_name, :last_name, :introduction
  end
end