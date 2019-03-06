module V1
  class JoinStudentsSerializer < ActiveModel::Serializer
    attributes :student_id, :nickname, :email
    def student_id
      object.id
    end
  end
end