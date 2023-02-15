require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /about' do
    it 'works' do
      get '/about'

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Hi, I&#39;m Hegwin!'
    end
  end

  describe 'GET /archived_about_2013' do
    it 'works' do
      get '/archived_about_2013'

      expect(response).to have_http_status(200)
      expect(response.body).to include 'About Hegwin and His Dream'
    end
  end
end
