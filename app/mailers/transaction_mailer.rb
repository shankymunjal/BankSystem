class TransactionMailer < ApplicationMailer
	default from: "noreply@abc.com"
	def notify_user(transaction)
		@transaction = transaction
		@account = @transaction.account
		@user = @account.user
		mail(to: @user.email, subject: "Transaction happenend in your account")
	end	
end
