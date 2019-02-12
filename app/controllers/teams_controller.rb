class TeamsController < ApplicationController
  def show
    @student = current_student
    @teams = @student.teams
  end

  def index
  end
end
