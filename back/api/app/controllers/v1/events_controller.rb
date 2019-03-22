module V1
  class EventsController < ApplicationController
  skip_before_action :authenticate_student_from_token!
  skip_before_action :authenticate_company_from_token!
  protect_from_forgery :except => [:index, :create, :show, :myhacks, :join_students]
  def index
     render json: Event.all, each_serializer: V1::EventSerializer
  end

  def show
    @event = Event.find(params[:id])
    render json: @event, each_serializer: V1::EventSerializer
  end

  def create
     @event = Event.new(event_params)
     binding.pry
     render json: @event, each_serializer: V1::EventSerializer
  end

  def myhacks
    student = Student.find(params[:id])

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
    params.require(:event).permit(:title,:date,:content, :company_id)
  end
end
end
