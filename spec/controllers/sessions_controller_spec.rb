require 'rails_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_successful
    end
  end

  describe "GET 'create'" do
    let(:user) { create :user }

    it "login successfully" do
      post 'create', params: { name: user.name, password: user.password }

      expect(session[:user_id]).to eq(user.id)
      expect(response).to redirect_to(admin_posts_url)
    end

    it "fails to login with incorrent info" do
      post 'create', params: { name: user.name, password: "" }

      expect(response).to redirect_to(login_url)
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete 'destroy'

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(login_url)
    end
  end

end
