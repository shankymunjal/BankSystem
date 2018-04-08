class AccountsController < ApplicationController
	before_action :authenticate_manager!
	def index
		@accounts = Account.all.includes(:user)
	end

	def show
		@account = Account.find(params[:id])
		@transactions = @account.transactions.limit(10)
	end
end