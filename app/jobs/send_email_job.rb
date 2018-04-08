class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    TransactionMailer.notify_user(transaction).deliver_later
  end
end
