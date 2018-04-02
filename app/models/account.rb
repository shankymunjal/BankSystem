class Account < ApplicationRecord
	belongs_to :user
	has_many :transactions

	def deposit(amount)
		self.amount = self.amount + amount
		self.save
	end

	def withdraw(amount)
		self.amount = self.amount - amount
		self.save		
	end
end
