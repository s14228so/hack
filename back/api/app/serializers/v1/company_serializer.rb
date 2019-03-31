module V1
  class CompanySerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers

    attributes :email, :introduction, :access_token, :name, :company_id, :token_type

    def token_type
      'Bearer'
    end

    def company_id
      object.id
    end

    # def image
    #   if object.images.present?
    #     url_for(object.images.last)
    #   end
    # end


  end
end



