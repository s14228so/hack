class PostsController < ApplicationController
  def index
    @following_users = current_user.followings | Array(current_user)
    @posts = Post.where(user: @following_users).order("created_at desc")

    @post = Post.new
  end

  def show
  end


  def new
    @post = current_user.posts.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to posts_path
    else
      @post = Post.new
      render "new"
    end
  end
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path
    else
      @post = Post.new
      render "new"
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end
end
