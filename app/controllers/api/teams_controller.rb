class Api::TeamsController < ApplicationController
  protect_from_forgery :except => [:index,:create, :show]
  def index
    @students = Student.all
    render "index", formats: "json", handlers: "jbuilder"
  end
  def show
    @teams = current_student.teams
    render "show", formats: "json", handlers: "jbuilder"
  end
end

