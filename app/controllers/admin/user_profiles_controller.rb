class Admin::UserProfilesController < ApplicationController
  before_action :find_user_and_profile

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected

  def find_user_and_profile
    @user = User.find(params[:user_id])
    #先检查是否存在profile，若没有使用@user.create_profile新建
    @profile = @user.profile || @user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:legal_name, :birthday, :location, :education, :occupation, :bio, :specialty)
  end

end
