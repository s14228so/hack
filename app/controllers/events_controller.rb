class EventsController < ApplicationController
  def show
    @student = current_student
    @events = Event.all
    @event = Event.find(params[:id])
    @my_event_id = @student.event_students.pluck(:event_id)
    @my_event = Event.where(id :@my_event_id)
    @event_student_ids = @event.event_students.pluck(:student_id)
    @join_students = Student.where(id: @event_student_ids)
   
  end

  def index
  end
end
