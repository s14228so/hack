class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def photo
    @user = current_user
  end

  def update
    @user = current_user
      @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render "photo"
    end
  end

  def edit
  end

  def destroy
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
     params.require(:user).permit(:gender, :status, :team_id, :area, :image)
  end
end


