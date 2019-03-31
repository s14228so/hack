module V1
  class SessionsController < ApplicationController
    protect_from_forgery with: :null_session 
    skip_before_action :authenticate_student_from_token!
    skip_before_action :authenticate_company_from_token!
 

    # POST /v1/login
    def create
      # response.headers['X-CSRF-Token'] = form_authenticity_token
      @student = Student.find_for_database_authentication(email: params[:email])
      binding.pry
      return invalid_email unless @student

      if @student.valid_password?(params[:password])
        sign_in :student, @student
        @student.access_token = "s#{@student.id}:#{Devise.friendly_token}"
        @student.save!
        render json: @student, serializer: SessionSerializer, root: nil
      else
        invalid_password
      end
    end

    def destroy
      @student = Student.find_for_database_authentication(access_token: params[:access_token])
      @student.access_token = ""
      render json: @student, serializer: SessionSerializer, root: nil
      @student.save!
    end


    def company_create
       # response.headers['X-CSRF-Token'] = form_authenticity_token
      @company = Company.find_for_database_authentication(email: params[:email])

      return invalid_email unless @company

      if @company.valid_password?(params[:password])
        sign_in :company, @company
        @company.access_token = "c#{@company.id}:#{Devise.friendly_token}"
        @company.save!
        render json: @company, serializer: CompanySerializer, root: nil
      else
        invalid_password
      end

    end

    def company_destroy
      @company = Company.find_for_database_authentication(access_token: params[:access_token])
      # binding.pry
      # sign_out @company
      @company.access_token = ""
      render json: @company, serializer: CompanySerializer, root: nil
      @company.save!
    end

    private

    def invalid_email
      warden.custom_failure!
      render json: { error: ('メールアドレスが正しくありません') }
    end

    def invalid_password
      warden.custom_failure!
      render json: { error: ('パスワードが正しくありません') }
    end
  end
end


