require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /' do
    let!(:post_1) { create :post }
    let!(:post_2) { create :post }

    it 'shows post list' do
      get '/'
      expect(response).to have_http_status(200)

      expect(response.body).to include post_1.title_en
      expect(response.body).to include post_2.title_en
    end

    context 'pagination' do
      before { 10.times { create :post } }

      it 'shows pagination' do
        get '/'

        expect(response).to have_http_status(200)
        expect(response.body).to include 'Next Page'
        expect(response.body).not_to include 'Prev Page'

        get '/?page=2'

        expect(response).to have_http_status(200)
        expect(response.body).not_to include 'Next Page'
        expect(response.body).to include 'Prev Page'
      end
    end

    context 'tags' do
      before { post_1.update tag_list: 'Ruby,Dynamic Programming' }

      it 'displays tags' do
        get '/'

        expect(response.body).to include '?tag=Ruby'
        expect(response.body).to include '?tag=Dynamic+Programming'
      end
    end
  end

  describe 'GET /posts/:friendly-id' do
    let!(:post) { create :post, tag_list: ['PostgresQL'], title_en: 'PostgresQL transaction and rollback', posted_on: Time.new(2023, 2, 14, 14) }

    it 'shows post' do
      get '/posts/postgresql-transaction-and-rollback'

      expect(response).to have_http_status(200)
      expect(response.body).to include post.title_en
      expect(response.body).to include post.title_zh
      expect(response.body).to include '2023年2月14日'
      expect(response.body).to include '?tag=PostgresQL'
    end
  end
end
