module V1
  class StudentsController < ApplicationController
    protect_from_forgery with: :null_session 
    skip_before_action :authenticate_student_from_token!
    skip_before_action :authenticate_company_from_token!


    def index
      render json: Student.all, each_serializer: V1::StudentSerializer
    end

    def show
      @student = Student.find(params[:id])
      render json: @student, each_serializer: V1::CurrentStudentSerializer
    end

    def one
      @student = Student.find(params[:id])
      render json: @student, each_serializer: V1::CurrentStudentSerializer
    end

    def current
      student = Student.find(params[:id])
      render json: student.events, each_serializer: V1::CurrentEventsSerializer
    end

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

    def image
      @student = Student.find(params[:id])
      @student.update(image_params)
    end


    private

    def student_params
      params.require(:student).permit(:email, :password, :grade, :university, :department, :app, :nickname, :university, :department, :address, :introduction, :phone_number, :last_name, :first_name, :image )
    end

    def image_params
      params.require(:student).permit(:images)
    end


  end
end
