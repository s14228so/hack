class Api::StudentsController < ApplicationController
  protect_from_forgery :except => [:index, :create, :show]
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
