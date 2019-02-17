module V1
  class EventsController < ApplicationController
  protect_from_forgery :except => [:index,:create, :show, :myhacks, :join_students]
  def index
     render json: Event.all, each_serializer: V1::EventSerializer
  end

  def show
    @event = Event.find(params[:id])
    render "show", formats: "json", handlers: "jbuilder"
  end

  def myhacks
    @myhacks = current_student.events
    render json: @myhacks, each_serializer: V1::MyHacksSerializer
  end

  def join_students
    @event = Event.find(params[:id])
    @join_students = @event.students
    render json: @join_students, each_serializer: V1::JoinStudentsSerializer
  end
end
end