class TransactionsController < ApplicationController
	before_action :authenticate_user!
	def index
		@transactions = Transaction.all.includes(:account).limit(10)
	end
	def new
		@transaction = Transaction.new
		@user = get_user
		if ["deposit", "withdraw"].include? params[:transaction_type]
			@action = params[:transaction_type]
		end
	end
	def deposit
		@transaction = Deposit.new(transaction_params)
		@transaction.account_id = current_account.id
		if @transaction.save
			redirect_to root_path
		end
	end
	def withdraw
		@transaction = Withdraw.new(transaction_params)
		@transaction.account_id = current_account.id
		if @transaction.save
			redirect_to root_path
		end		
	end

	private
	def transaction_params
		params.require(:transaction).permit(:amount)
	end

	def get_user
		if params[:user_id]
			User.find(params[:user_id])
		else
			current_user
		end		
	end

end
