module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_student_from_token!

    # POST /v1/login
    def create
      @student = Student.find_for_database_authentication(email: params[:email])
      return invalid_email unless @student

      if @student.valid_password?(params[:password])
        sign_in :student, @student
        render json: @student, serializer: SessionSerializer, root: nil
      else
        invalid_password
      end
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


