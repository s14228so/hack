class EventsController < ApplicationController
  def show
    @student = current_student
    @events = Event.all
    @event = Event.find(params[:id])
    @my_event = @student.events
    @join_students = @event.students
   
  end

  def index
  end
end
