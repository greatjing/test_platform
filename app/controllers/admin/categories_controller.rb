class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  def admin_required
    if !current_user.is_admin?
      redirect_to "/", alert: "you are not admin."
    end
  end

  def index
    @categories = Category.all
  end

end
