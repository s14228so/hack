module V1
  class SessionSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers


    attributes :email, :nickname, :image, :university, :department,:grade,:first_name,:last_name,:app,:phone_number,:address, :token_type, :student_id, :access_token

    def student_id
      object.id
    end

    def image
          url_for(object.images[0])
    end

    def token_type
      'Bearer'
    end

  end
end

