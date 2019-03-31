module V1
  class CompaniesController < ApplicationController
    protect_from_forgery with: :null_session 
    skip_before_action :authenticate_company_from_token!, only: [:create, :update, :image, :events]
    skip_before_action :authenticate_student_from_token!

    # def index
    #   render json: company.all, each_serializer: V1::companySerializer
    # end

    def show
      render json: current_company, each_serializer: V1::CurrentcompanySerializer
    end

    def one
      @company = company.find(params[:id])
      render json: @company, each_serializer: V1::CurrentcompanySerializer
    end

    def current
      render json: current_company.events, each_serializer: V1::CurrentEventsSerializer
    end

    def events
       @company = Company.find(params[:id])
       @events = @company.events
       render json: @events, each_serializer: V1::EventSerializer
    end


    def create
      @company = Company.new company_params
      @company.access_token = "c:#{Devise.friendly_token}"
      if @company.save!
        render json: @company, serializer: V1::CompanySerializer, root: nil
      else
        render json: { error: t('company_create_error') }, status: :unprocessable_entity
      end
    end

    def update
      @company = Company.find(params[:id])
      if @company.update(company_params)
        render json: @company, serializer: V1::companySerializer
      else
        render json: { error: t('company_create_error') }, status: :unprocessable_entity
      end
    end

    def image
      @company = company.find(params[:id])
      @company.update(image_params)
    end


    private

    def company_params
      params.require(:company).permit(:email, :password, :name, :access_token)
    end

    def image_params
      params.require(:company).permit(:images)
    end
 end
end
