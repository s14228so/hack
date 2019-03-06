class Api::StudentsController < ApplicationController
  def index
    @students = Student.all
    render "index", formats: "json", handlers: "jbuilder"
  end
  def show
    @student = current_student
    render "show", formats: "json", handlers: "jbuilder"
    # url_for(@student.images[0])
  end
end
