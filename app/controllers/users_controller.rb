class UsersController < ApplicationController
  #before_action :check_permission

  def users
  	check_permission("You do not have permission to view that page")
    @users = User.all()
  end

  def approve
  	check_permission("I'm sorry Dave, I'm afraid I can't do that")
  	if current_user.admin?
	  	id = params[:id]
	  	user = User.find(id)
	  	user.approved = true
	  	user.save
	  	redirect_to users_path, notice: user.email + " is now approved"
	end
  end

  def make_admin
  	check_permission("I'm sorry Dave, I'm afraid I can't do that")
  	if current_user.admin?
	  	id = params[:id]
	  	user = User.find(id)
	  	user.admin = true
	  	user.save
	  	redirect_to users_path, notice: user.email + " is now an admin, great power, great responsibility, blah blah blah"
	end
  end

  protected

  def check_permission(fail_message)
  	unless current_user.admin?
  		redirect_to root_path, alert: fail_message and return
  	end
  end

end

