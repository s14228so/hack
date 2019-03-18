module V1
  class TeamSerializer < ActiveModel::Serializer
      attributes :id, :name, :introduction 
      has_many :students

      class StudentSerializer < ActiveModel::Serializer
       include Rails.application.routes.url_helpers

        attributes :student_id, :email, :access_token, :nickname, :image, :created_at, :app,:updated_at, :grade, :university, :department, :address, :phone_number, :first_name, :last_name, :introduction
        def student_id
          object.id
        end
        def image
          if object.images.present?
            url_for(object.images.last)
          end
        end
      end

  end
end



