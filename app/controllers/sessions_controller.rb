class SessionsController < ApplicationController
	# def new
	# end

	# def create
	# 	if user = User.authenticate(params[:email_address], params[:password])
	# 		session[:current_user_id] = user.id
	# 		redirect_to root_url
	# 	end
	# 	# Use the stuff listed below for cookie handling
	# 	# user = User.find_by(email_address: params[:session][:email_address].downcase)
	# 	# if user && user.authenticate(params[:session][:password])
	# 	# 	sign_in user
	# 	# 	redirect_to user
	# 	# else
	# 	# 	flash.now[:error] = "Invalid email/password combination."
	# 	# 	render :new
	# 	# end
	# end

	# def destroy
	# 	@_current_user = session[:current_user_id] = nil
	# 	redirect_to root_url, alert: "YOu have successfully logged out."
	# 	# The below is for the cookie handling
	# 	# sign_out
	# 	# redirect_to signin_path
	# end

	def create
  		user = User.find_by(email_address: params[:user][:email]).try(:authenticate, params[:user][:password])
  		if user == false || user.nil?
  			redirect_to root_path, alert: "You've been logged in."#, flash: { message: "Incorrect email/password" }
  		else
  			sign_in(user)
  			redirect_to user_path(user)
  		end
  	end

  	def new
    	if signed_in?
      		redirect_to root_path
    	else
     		@user = User.new
    	end
  	end

  	def destroy
  		sign_out
  		redirect_to root_path
  	end
end
