class StudentsController < ApplicationController

  def index
  end

  def show
    @students = Student.all
    @student = current_student
    @events = Event.all
    @event_students = @student.event_students
     @event_ids = []
      @my_events = []
    @event_students.each do |event_student|
      @event_ids << event_student.event_id
      @my_events << event_student.event
    end
   


  end

  def edit
  end
end
