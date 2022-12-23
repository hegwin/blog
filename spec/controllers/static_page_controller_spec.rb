require 'rails_helper'

describe StaticPageController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_successful
    end
  end

end
