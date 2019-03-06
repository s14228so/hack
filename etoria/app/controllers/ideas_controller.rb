class IdeasController < ApplicationController
  def index
    @ideas = Idea.order("created_at desc")
    @idea = current_user.ideas.new
  end

  def new

  end

  def create
    @idea = current_user.ideas.new(idea_params)
    if @idea.save
      redirect_to ideas_path
    else
      render "index"
    end

  end

  def show
  end

  def edit
  end
  def destroy
    idea = Idea.find(params[:id])
    if idea.destroy
      redirect_to ideas_path
    else
      render "index"
    end
  end

  private
  def idea_params
    params.require(:idea).permit(:title,:body, :image)
  end
end
