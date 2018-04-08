class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	private
	def current_account
		current_user.account
	end
	def authenticate_manager!
		if !current_user.is_a? Manager
			redirect_to root_path
		end
	end  
end
