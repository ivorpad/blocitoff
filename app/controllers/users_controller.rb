class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "Information Updated"
      redirect_to edit_user_registration_path(current_user)
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def show
    @user = User.find(params[:id])
    #@items = Item.find(params[:user_id])
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
