module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :nickname, :university, :department,:grade,:first_name,:last_name,:app,:phone_number,:address, :token_type, :student_id, :access_token

    def student_id
      object.id
    end

    def token_type
      'Bearer'
    end

  end
end

