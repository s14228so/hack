module V1
  class EventsController < ApplicationController
  skip_before_action :authenticate_student_from_token!, except: [:myhacks]
  protect_from_forgery :except => [:index, :create, :show, :myhacks, :join_students]
  def index
     render json: Event.all, each_serializer: V1::EventSerializer
  end

  def show
    @event = Event.find(params[:id])
    render json: @event, each_serializer: V1::EventSerializer
  end

  def create
  end

  def myhacks
    student = current_student
    if student.events.present?
      @myhacks = student.events
    else
      @myhacks = []
    end
    render json: @myhacks, each_serializer: V1::MyHacksSerializer
  end

  def join_students
    @event = Event.find(params[:id])
    @join_students = @event.students
    render json: @join_students, each_serializer: V1::JoinStudentsSerializer
  end


  private
    def event_params
      params.require(:student).permit(:email, :password, :grade, :university, :department, :app, :nickname, :university, :department, :address, :introduction, :phone_number, :last_name, :first_name, :image )
    end

    def image_params
      params.require(:student).permit(:images)
    end
end
end
