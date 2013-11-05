class SessionsController < ApplicationController


  def create
  	user = User.find_by(email_address: params[:user][:email_address]).try(:authenticate, params[:user][:password])
  	if user == false || user.nil?
  		redirect_to new_session_path, flash: { message: "Incorrect email/password" }
  	else
  		sign_in(user)
  		redirect_to scheduled_event_path(user)
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
