class AccountsController < ApplicationController
	before_action :authenticate_manager!
	def index
		@accounts = Account.all.includes(:user)
	end

	def show
		@account = Account.find(params[:id])
		@transactions = @account.transactions.limit(10)
	end

	private
	def authenticate_manager!
		if !current_user.is_a? Manager
			redirect_to root_path
		end
	end
end