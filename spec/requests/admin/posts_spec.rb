require 'rails_helper'

RSpec.describe "Admin::Posts", type: :request do
  let(:user) { create :user }
  let(:session) {{ user_id: user.id }}

  before do
    allow_any_instance_of(Admin::PostsController).to receive(:session) { session}
  end

  context 'no user logged in' do
    let(:session) {{}}

    it 'redirects to login page' do
      get '/admin/posts'
      expect(response).to redirect_to '/login'
    end
  end

  describe 'GET /admin/posts' do
    let!(:online_post) { create :post, status: :online }
    let!(:offline_post) { create :post, status: :offline }

    it 'shows post list' do
      get '/admin/posts/'

      expect(response).to have_http_status(200)
      expect(response.body).to include online_post.title_zh
      expect(response.body).to include offline_post.title_zh
    end
  end

  describe 'GET /admin/posts/:slug' do
    let!(:post) { create :post }

    it 'displays post' do
      get "/admin/posts/#{post.slug}"

      expect(response).to have_http_status(200)
      expect(response.body).to include post.title_en
      expect(response.body).to include post.title_zh
    end
  end

  describe 'GET /admin/posts/new' do
    it 'shows a form for post' do
      get '/admin/posts/new'

      expect(response).to have_http_status(200)
      expect(response.body).to include 'Title en'
      expect(response.body).to include 'Body'
      expect(response.body).to include 'Tag list'
    end
  end

  describe 'GET /admin/posts/:slug/edit' do
    let!(:post) { create :post }

    it 'shows a form to edit post' do
      get "/admin/posts/#{post.slug}/edit"

      expect(response).to have_http_status(200)
      expect(response.body).to include post.body_zh
    end
  end

  describe 'POST /admin/posts' do
    let(:valid_attributes) do
      {
        title_en: 'How to prove Wallis Formula',
        title_zh: '如何证明Wallis公式',
        body_zh: 'In mathematics, the Wallis product for π, published in 1656 by John Wallis, states that {\displaystyle {\begin{aligned}{\frac {\pi }{2}}&=\prod _{n=1}^{\infty }{\frac {4n^{2}}{4n^{2}-1}}=\prod _{n=1}^{\infty }\left\\[6pt]&={\Big }\cdot {\Big }\cdot {\Big }\cdot {\Big }\cdot \;\cdots \\\end{aligned}}}',
        tag_list: 'math',
        posted_on: '2023-02-17'
      }
    end

    context 'with valid params' do
      it 'creates a new Post' do
        expect {
          post '/admin/posts', params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post '/admin/posts', params: { post: valid_attributes }
        expect(response).to redirect_to("/admin/posts/#{Post.last.slug}")
      end
    end

    context 'with invalid params' do
      it 'shows error messages' do
        post '/admin/posts', params: { post: valid_attributes.slice(:title_zh, :title_en)}
        expect(response.body).to include 'Body zh can&#39;t be blank'
      end
    end
  end

  describe 'PUT /admin/posts/:slug' do
    let!(:post) { create :post }

    context 'with valid params' do
      it 'updates the requested post' do
        put "/admin/posts/#{post.slug}", params: { post: { title_zh: 'My New Title' } }
        expect(post.reload.title_zh).to eq 'My New Title'
      end

      it 'redirects to the post' do
        put "/admin/posts/#{post.slug}", params: { post: { title_en: 'My New Title' } }
        post.reload
        expect(response).to redirect_to "/admin/posts/#{post.slug}"
      end
    end

    context 'with invalid params' do
      it 'shows error messages' do
        put "/admin/posts/#{post.slug}", params: { post: { title_en: '' } }
        expect(response.body).to include 'Title en can&#39;t be blank'
      end
    end
  end

  describe 'DELETE /admin/posts/:slug' do
    let!(:post) { create :post }

    it 'destroys the requested pos' do
      expect {
        delete "/admin/posts/#{post.slug}"
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete "/admin/posts/#{post.slug}"
      expect(response).to redirect_to '/admin/posts'
    end
  end
end
