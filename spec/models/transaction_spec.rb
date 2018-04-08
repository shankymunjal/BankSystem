require 'rails_helper'

RSpec.describe Transaction, type: :model do
  fixtures :users, :transactions, :accounts

  it { should belong_to( :account)}
  
  let (:transaction) { Transaction.new }
  let (:deposit) { Deposit.new }
  let (:withdraw) { Withdraw.new }

  context "attributes" do
    [:amount, :type, :account_id].each do |_attr|
      it "should respond to attributes: #{_attr}" do
        transaction.should respond_to(_attr)
      end
    end
  end
  context "STI" do
  	it "should have type equal to class name" do
  		expect(deposit.type).to eq("Deposit")
  		expect(withdraw.type).to eq("Withdraw")
  	end
  end
  context "filter" do
  	it "should return the filterd data according to date time" do
  		transactions = Transaction.filter("2018-03-01", "2018-03-30")
  		expect(transactions.length).to eq(6)
  		expect(transactions.where(type: "Deposit").length).to eq(5)
  		expect(transactions.where(type: "Withdraw").length).to eq(1)
  	end
  end

end
