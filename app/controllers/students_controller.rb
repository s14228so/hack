class StudentsController < ApplicationController

  def index
  end

  def show
    @students = Student.all
    @student = current_student
    @events = Event.all
  end

  def edit
  end
end
