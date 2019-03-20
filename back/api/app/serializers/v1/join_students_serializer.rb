module V1
  class JoinStudentsSerializer < ActiveModel::Serializer
      include Rails.application.routes.url_helpers
    attributes :student_id, :nickname, :email, :image
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