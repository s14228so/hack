class StudentsController < ApplicationController

  def index
  end

  def show
    @students = Student.all
    @student = current_student
    @events = Event.all
    @event_students = @student.event_students
  end

  def edit
  end
end
