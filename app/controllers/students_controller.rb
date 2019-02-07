class StudentsController < ApplicationController

  def index
  end

  def show
    @students = Student.all
    @student = current_student
    @events = Event.all
    @event_students = @student.event_students
     @event_ids = []
    @event_students.each do |event_student|
      @event_ids << event_student.event_id
    end

  end

  def edit
  end
end
