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

    context 'status' do
      before { post_1.update status: :offline }

      it 'does not show offline post' do
        get '/'

        expect(response.body).not_to include post_1.title_en
        expect(response.body).to include post_2.title_en
      end
    end

    context 'mobility' do
      it 'shows ZH content preview by default' do
        get '/'

        expect(response.body).to include post_1.body_zh.first(50)
        expect(response.body).to include post_2.body_zh.first(50)
      end

      it 'shows EN content preview when locale is :en' do
        get '/en'

        expect(response.body).to include post_1.body_en.first(50)
        expect(response.body).to include post_2.body_en.first(50)
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

    context 'mobility' do
      it 'shows ZH content by default' do
        get '/posts/postgresql-transaction-and-rollback'

        expect(response.body).to include post.body_zh.split("\n").last
      end

      it 'shows EN content when locale is :en' do
        get '/en/posts/postgresql-transaction-and-rollback'

        expect(response.body).to include 'Feb 14, 2023'
        expect(response.body).to include post.body_en.split("\n").last
      end
    end
  end
end
