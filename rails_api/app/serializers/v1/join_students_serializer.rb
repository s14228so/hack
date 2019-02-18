module V1
  class JoinStudentsSerializer < ActiveModel::Serializer
    attributes :id, :nickname, :email
  end
end