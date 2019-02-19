module V1
  class StudentsController < ApplicationController
    protect_from_forgery with: :null_session 
    skip_before_action :authenticate_student_from_token!, only: [:create, :update]


    def index
      render json: Student.all, each_serializer: V1::StudentSerializer
    end

    def show
      render json: current_student, each_serializer: V1::CurrentStudentSerializer
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

    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
        render json: @student, serializer: V1::StudentSerializer
      else
        render json: { error: t('student_create_error') }, status: :unprocessable_entity
      end
    end

    private

    def student_params
      params.require(:student).permit(:email, :password, :grade, :university, :department, :app, :nickname, :university, :department, :address, :introduction, :phone_number, :last_name, :first_name, :images )
    end
  end
end
