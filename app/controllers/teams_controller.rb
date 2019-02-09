class TeamsController < ApplicationController
  def show
    @student = current_student
  end

  def index
  end
end
