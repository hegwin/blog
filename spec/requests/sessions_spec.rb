require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  describe 'GET /login' do
    it 'shows login form' do
      get '/login'

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Name'
      expect(response.body).to include 'Password'
      expect(response.body).to include '<meta name="robots" content="noindex, nofollow">'
    end
  end

  describe 'POST /login' do
    let(:user) { create :user }

    context 'password matched' do
      it 'sets session and redirects' do
        post '/login', params: { name: user.name, password: 'P4$$word' }

        expect(response).to have_http_status(302)
        expect(session[:user_id]).to eq user.id
        expect(response).to redirect_to '/admin/posts'
      end
    end

    context 'password invalid' do
      it 'shows error message' do
        post '/login', params: { name: user.name, password: 'somethingwrong' }

        expect(response).to have_http_status(302)
        expect(session[:user_id]).to be_blank
        expect(response).to redirect_to '/login'
      end
    end
  end

  describe 'DELETE /logout' do
    let(:user) { create :user }
    before do
      post '/login', params: { name: user.name, password: 'P4$$word' }
    end

    it 'clears user_id in session and redirects' do
      expect { delete '/logout' }.to change { session[:user_id] }.to(nil)
      expect(response).to redirect_to '/login'
    end
  end
end
