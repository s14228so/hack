module V1
  class StudentsController < ApplicationController
    skip_before_action :authenticate_student_from_token!, only: [:create]


    def index
      render json: Student.all, each_serializer: V1::StudentSerializer
    end

    def current
      render json: current_student.events, each_serializer: V1::CurrentEventsSerializer
    end

    # POST
    # Create an user
    def create
      @student = Student.new student_params

      if @student.save!
        render json: @student, serializer: V1::SessionSerializer, root: nil
      else
        render json: { error: t('student_create_error') }, status: :unprocessable_entity
      end
    end

    private

    def student_params
      params.require(:student).permit(:email, :password, :nickname, :university)
    end
  end
end
