require 'rails_helper'

RSpec.describe "AccountController", :type => :request do
  fixtures :users, :transactions, :accounts
  describe "INDEX" do
    it "should redirect to home page as user is not logged in " do
      get '/accounts'
      expect(response.status).to be(302)
    end
    it "should redirect to home page as user is not manager " do
      login_as users(:bob), scope: :user
      get '/accounts'
      expect(response.status).to be(302)
      response.should redirect_to root_path
    end
    it "should return all account details" do
      login_as users(:manager), scope: :user
      get '/accounts'
      expect(response.status).to be(200)
      expect(assigns(:accounts).count).to eq(3)
      response.should render_template :index
    end
  end

  describe "SHOW" do
    it "should redirect to home page as user is not logged in " do
      get '/accounts/1'
      expect(response.status).to be(302)
    end
    it "should redirect to home page as user is not manager " do
      login_as users(:bob), scope: :user
      get '/accounts/1'
      expect(response.status).to be(302)
      response.should redirect_to root_path
    end
    it "should return account details" do
      login_as users(:manager), scope: :user
      get '/accounts/1'
      expect(response.status).to be(200)
      expect(assigns(:account)).to eq(accounts(:bob_account))
      response.should render_template :show
    end
  end
end