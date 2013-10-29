class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to welcome_index_path, flash: { success: "Registration sucessful, please log in."}
  	else
  		redirect_to new_user_path, flash: { errors: @user.errors.full_messages }
  	end
  end

  def settings
  end

  def edit
  end


  private

  def user_params
  	params.require(:user).permit(:first_name,:last_name,:email_address, :password,:password_confirmation, :phone_number)
  end
end
