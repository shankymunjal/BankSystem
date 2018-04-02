class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  	@account = current_account
  	@transactions = @account.transactions.limit(10)
  end
end
