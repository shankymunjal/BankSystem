require 'rails_helper'

RSpec.describe "TransactionsController", :type => :request do
  fixtures :users, :transactions, :accounts
  describe "GET" do
    it "should redirect to home page as user is not logged in " do
      get '/transactions'
      expect(response.status).to be(302)
    end
    it "should redirect to home page as logged user is not manager " do
      login_as users(:bob), scope: :user
      get '/transactions'
      expect(response.status).to be(302)
    end
    it "should return max 10 transactions " do
      login_as users(:manager), scope: :user
      get '/transactions'
      expect(response.status).to be(200)
      expect(assigns(:transactions).count).to eq(7)
      response.should render_template :index
    end
  end

  describe "Deposit" do
    it "should redirect to login page as user is not logged in " do
      post '/transactions/deposit', params: {transaction: {amount: 100}}
      expect(response.status).to be(302)
      response.should redirect_to new_user_session_url
    end
    it "should add amount to the account " do
      login_as users(:bob), scope: :user
      post '/transactions/deposit', params: {transaction: {amount: 100}}
      expect(response.status).to be(302)
      expect(Transaction.count).to eq(8)
      expect(Transaction.last.amount).to eq(100)
      expect(accounts(:bob_account).amount).to eq(1100)
      response.should redirect_to root_url
    end
  end

  describe "Withdraw" do
    it "should redirect to login page as user is not logged in " do
      post '/transactions/withdraw', params: {transaction: {amount: 100}}
      expect(response.status).to be(302)
      response.should redirect_to new_user_session_url
    end
    it "should remove amount to the account " do
      login_as users(:bob), scope: :user
      post '/transactions/withdraw', params: {transaction: {amount: 100}}
      expect(response.status).to be(302)
      expect(Transaction.count).to eq(8)
      expect(Transaction.last.amount).to eq(100)
      expect(accounts(:bob_account).amount).to eq(900)
      response.should redirect_to root_url
    end
  end
end