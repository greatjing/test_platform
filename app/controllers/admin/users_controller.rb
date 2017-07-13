class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  def admin_required
    if !current_user.is_admin?
      redirect_to "/", alert: "you are not admin."
    end
  end

  def index
    # @users = User.all
    @users = User.includes(:groups).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :group_ids => [])
  end

end
