class Transaction < ApplicationRecord
  belongs_to :account
  attr_accessor :deposit, :withdraw

  after_save :update_account
  after_commit :notify_user

  def update_account
  	if self.is_a? Deposit
  		account.deposit(amount)
  	else
  		account.withdraw(amount)
  	end
  end

  def notify_user
  	
  end
end
