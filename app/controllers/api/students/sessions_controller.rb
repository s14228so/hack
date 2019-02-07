class Api::Students::SessionsController < ApplicationController
   protect_from_forgery :except => [:destroy]
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    return invalid_email unless @user

    if @user.valid_password?(params[:password]) then
      sign_in :user, @user
      render json: @user
    else
      invalid_password
    end
  end

  def destroy
    if sign_out(current_student)
      render :json => {success: true}
    else
      render :json => {success: false}
    end
  end
end
