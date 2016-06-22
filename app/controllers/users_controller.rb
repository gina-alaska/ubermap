class UsersController < ApplicationController
  include GinaAuthentication::Users
  layout 'manager'

  before_action :set_user, only: [:edit, :update]
  authorize_resource

  def index
    @users = User
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to users_path, notice: 'User updated' }
      else
        format.html { render :edit, notice: 'Unable to update user' }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
