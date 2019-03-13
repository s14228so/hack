module V1
  class CompanySerializer < ActiveModel::Serializer

    attributes :email,:name, :email, :introduction,:access_token

    def token_type
      'Bearer'
    end

  end
end

