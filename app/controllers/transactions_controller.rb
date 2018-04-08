require 'csv'
class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :authenticate_manager!, only: [:index, :download]
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

	def download
		@account = Account.find(params[:account_id])
		@transactions = @account.transactions.filter(params[:from_date], params[:to_date])
        csv_string = CSV.generate do |csv|
             csv << ["Amount", "Type", "Datetime"]
             @transactions.each do |transaction|
               csv << [transaction.amount, transaction.type, transaction.created_at]
             end
        end
       send_data csv_string,
       :type => 'text/csv; charset=iso-8859-1; header=present',
       :disposition => "attachment; filename=users.csv"		
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
