module SessionsHelper
	# def sign_in(user)
	# 	#Remember token as a cookie and then find the user record in the database
	# 	# as the user moves from page to page
	# 	remember_token = User.new_remember_token #create token
	# 	cookies.permanent[:remember_token] = remember_token #remember the token for 20 years
	# 	user.update_attribute(:remember_token, User.encrypt(remember_token)) #save the newly encrypted token to the database
	# 	self.current_user = user #sets current user to the current user
	# end

	# def signed_in?
	# 	!current_user.nil?
	# end

	# #stores users for later use
	# def current_user=(user)
	# 	@current_user = user
	# end

	# # set the @current_user instance to the user corresponding to the remember token if not currently defined
	# def current_user
	# 	remember_token = User.encrypt(cookies[:remember_token])
	# 	@current_user ||= User.find_by(remember_token: remember_token)
	# end


	def sign_in user
		session[:user_id] = user.id
	end

	def current_user= user
		@current_user = user
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil
	end

	def current_user? user
		user === current_user
	end

	def deny_access
		redirect_to new_user_path, notice: "Please sign in to access this page."
	end
end
