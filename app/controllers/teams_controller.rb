class TeamsController < ApplicationController
  def show
    @student = current_student
    @student_team = @student.student_teams 
    team_ids = @student.student_teams.pluck(:team_id)
    @teams = Team.where(id: team_ids)
  end

  def index
  end
end
