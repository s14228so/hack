class Api::StudentsController < ApplicationController
  def get_info
    @student = current_student
  end

  def index
    @students = Student.all
    render "index", formats: "json", handlers: "jbuilder"
  end
end
