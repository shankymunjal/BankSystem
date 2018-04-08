require 'rails_helper'

RSpec.describe Account, type: :model do
  fixtures :users, :transactions, :accounts

  it { should belong_to(:user)}
  it { should have_many(:transactions)}
  
  let (:account) { Account.new }

  context "attributes" do
    [:amount, :user_id, :number].each do |_attr|
      it "should respond to attributes: #{_attr}" do
        account.should respond_to(_attr)
      end
    end
  end
  context "deposit" do
    it "should add amount to the account" do
        accounts(:bob_account).deposit(150)
        expect(accounts(:bob_account).amount).to eq(1150)
	end
  end
  context "withdraw" do
    it "should remove amount to the account" do
        accounts(:bob_account).withdraw(150)
        expect(accounts(:bob_account).amount).to eq(850)
	end
  end
end
