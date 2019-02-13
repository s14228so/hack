module V1
  class SessionSerializer < ActiveModel::Serializer

    attributes :email, :token_type, :student_id, :access_token

    def student_id
      object.id
    end

    def token_type
      'Bearer'
    end

  end
end