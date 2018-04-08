require 'rails_helper'

RSpec.describe "DashboardController", :type => :request do
  fixtures :users, :transactions, :accounts
  describe "GET" do
    it "should redirect to login page as user is not logged in " do
      get '/'
      expect(response.status).to be(302)
    end
    it "should return account details " do
      login_as users(:bob), scope: :user
      get '/'
      expect(response.status).to be(200)
      expect(assigns(:transactions).count).to eq(7)
      expect(assigns(:account)).to eq(accounts(:bob_account))
      response.should render_template :index
    end
  end
end