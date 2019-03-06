class TeamsController < ApplicationController
  layout "home"
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
  end

  def edit
  end

  def destroy
  end

  def search
    @q = TeamZ.ransack(search_params)
    @staffs = @q.result(distinct: true)
  end

  private
  def search_params
      params.require(:q).permit(:name_cont)
  end

end
