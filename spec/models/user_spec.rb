require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users, :transactions, :accounts

  it { should have_one(:account)}
  
  let (:user) { User.new }
  let (:customer) { Customer.new }
  let (:manager) { Manager.new }
  let (:employee) { Employee.new }

  context "attributes" do
    [:email, :type].each do |_attr|
      it "should respond to attributes: #{_attr}" do
        user.should respond_to(_attr)
      end
    end
  end
  context "STI" do
  	it "should have type equal to class name" do
  		expect(customer.type).to eq("Customer")
  		expect(manager.type).to eq("Manager")
  		expect(employee.type).to eq("Employee")
  	end
  end
end
