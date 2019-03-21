module V1
  class SessionsController < ApplicationController
       protect_from_forgery with: :null_session 
    skip_before_action :authenticate_student_from_token!
    skip_before_action :authenticate_company_from_token!
 

    # POST /v1/login
    def create
      # response.headers['X-CSRF-Token'] = form_authenticity_token
      @student = Student.find_for_database_authentication(email: params[:email])
      return invalid_email unless @student

      if @student.valid_password?(params[:password])
        sign_in :student, @student
        @student.access_token = "#{@student.id}:#{Devise.friendly_token}"
        @student.save!
        render json: @student, serializer: SessionSerializer, root: nil
      else
        invalid_password
      end
    end

    def destroy
      @student = Student.find_for_database_authentication(access_token: params[:access_token])
      sign_out @student
      @student.access_token = ""
      render json: @student, serializer: SessionSerializer, root: nil
      @student.save!
    end


    def company_create
    end

    def company_destroy
    end

    private

    def invalid_email
      warden.custom_failure!
      render json: { error: t('invalid_email') }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: t('invalid_password') }
    end
  end
end


