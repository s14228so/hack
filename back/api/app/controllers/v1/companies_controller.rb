module V1
  class CompnaysController < ApplicationController
    protect_from_forgery with: :null_session 
    skip_before_action :authenticate_compnay_from_token!, only: [:create, :update, :image]
    skip_before_action :authenticate_student_from_token!

    def index
      render json: Compnay.all, each_serializer: V1::CompnaySerializer
    end

    def show
      render json: current_compnay, each_serializer: V1::CurrentCompnaySerializer
    end

    def one
      @compnay = Compnay.find(params[:id])
      render json: @compnay, each_serializer: V1::CurrentCompnaySerializer
    end

    def current
      render json: current_compnay.events, each_serializer: V1::CurrentEventsSerializer
    end

    # POST
    # Create an user
    def create
      @Compnay = Company.new company_params

      if @compnay.save!
        render json: @compnay, serializer: V1::CompanySerializer, root: nil
      else
        render json: { error: t('company_create_error') }, status: :unprocessable_entity
      end
    end

    def update
      @compnay = Company.find(params[:id])
      if @compnay.update(compnay_params)
        render json: @compnay, serializer: V1::CompnaySerializer
      else
        render json: { error: t('Compnay_create_error') }, status: :unprocessable_entity
      end
    end

    def image
      @compnay = Compnay.find(params[:id])
      @compnay.update(image_params)
    end


    private

    def company_params
      params.require(:compnay).permit(:email, :password)

    def image_params
      params.require(:compnay).permit(:images)
    end


  end
end
