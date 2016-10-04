class UsersController < ApplicationController
  #before_action :check_permission

  def users
  	check_permission
    @users = User.all()
  end

  def make_admin
  	id = params[:id]
  	user = User.find(id)
  	user.admin = true
  	user.save
  	redirect_to users_path, notice: user.email + " is now an admin, great power, great responsibility, blah blah blah"
  end

  protected

  def check_permission
  	unless current_user.admin?
  		redirect_to root_path, alert: "You do not have permissions to view that page"
  	end
  end
end

