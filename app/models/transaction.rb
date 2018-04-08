class Transaction < ApplicationRecord
  belongs_to :account
  attr_accessor :deposit, :withdraw

  after_save :update_account
  after_commit :notify_user

  scope :filter, ->(from_date, to_date) {
    where("created_at > ?", from_date)
    .where("created_at < ?", to_date)}

  def update_account
  	if self.is_a? Deposit
  		account.deposit(amount)
  	else
  		account.withdraw(amount)
  	end
  end

  def notify_user
    SendEmailJob.perform_later(self)
  end
end
