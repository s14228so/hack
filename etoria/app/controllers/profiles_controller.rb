class ProfilesController < ApplicationController
  def new
    @profile = current_user.build_profile
  end
  def show
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = Profile.find_by(user: @user)
  end


  def create
    profile = current_user.build_profile(profile_params)
    if profile.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def update
    profile = current_user.profile
    if profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:license, :skill, :appear, :user_id)
  end
end
