module V1
  class StudentSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes :student_id, :email, :access_token, :nickname, :image, :created_at, :app,:updated_at, :grade, :university, :department, :address, :phone_number, :first_name, :last_name, :introduction

    def student_id
      object.id
    end

    def image
          url_for(object.images.last)
    end
  
  end
end