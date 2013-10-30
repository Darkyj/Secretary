class SessionsController < ApplicationController
	def new
	end

	def create
		# user = User.authenticate(params[:session][:email_address], params[:session][:password])
		user = User.find_by(email_address: params[:session][:email_address].downcase)
		# if user.nil?
		# 	flash.now[:error] = "Invalid email/password combination."
		# 	render :new
		# else
		# 	sign_in user
		# 	redirect_to user
		# end
		if user && user.authenticate(params[:session][:password])
			# sign_in user
			
			redirect_to user
		else
			flash.now[:error] = "Invalid email/password combination."
			render :new
		end
	end

	def destroy
		sign_out
		redirect_to signin_path
	end
end
