class BlogsController < ApplicationController

    def show
      @team = Team.find(params[:team_id])
      @blogs = @team.blogs.order("created_at desc")
    end


    def new
      @blog = current_user.team.blogs.new
    end

    def create
      blog = current_user.team.blogs.new(blog_params)
      if blog.save
        redirect_to team_path(current_user.team)
      else
        render "new"
      end
    end
    def destroy
      blog = Blog.find(params[:id])
      if blog.destroy
        redirect_to team_path(current_user.team)
      else
        render "new"
      end
    end

    private
    def blog_params
      params.require(:blog).permit(:title, :body, :team_id)
    end
end
