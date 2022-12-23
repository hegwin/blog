require 'rails_helper'

describe Admin::PostsController do

  before do
    user = create :user
    session[:user_id] = user.id
  end

  let(:one_post) { create :post }
  let(:valid_attributes) { { "title_cn" => "MyString", "title_en" => "Title", "body" => "Some texts.", "posted_on" => "2022-12-24" } }

  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index
      expect(assigns(:posts)).to eq([one_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, params: { id: one_post.to_param }
      expect(assigns(:post)).to eq(one_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      get :edit, params: { id: one_post.to_param }
      expect(assigns(:post)).to eq(one_post)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: { post: valid_attributes }
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to([:admin, Post.last])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Post).to receive(:save) { false }
        post :create, params: { post: { "title_cn" => "invalid value" }}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Post).to receive(:save) { false }
        post :create, params: { post: { "title_cn" => "invalid value" }}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    context "with valid params" do
      it "updates the requested post" do
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        allow_any_instance_of(Post).to receive(:update_attributes).with({ "title_cn" => "MyString" })
        put :update, params: { id: one_post.to_param, post: { "title_cn" => "MyString" }}
      end

      it "assigns the requested post as @post" do
        put :update, params: { id: one_post.to_param, post: valid_attributes }
        expect(assigns(:post)).to eq(one_post)
      end

      it "redirects to the post" do
        put :update, params: { id: one_post.to_param, post: valid_attributes }
        one_post.reload
        expect(response).to redirect_to admin_post_path(one_post)
      end
    end

    context "with invalid params" do
      it "assigns the post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Post).to receive(:save) { false }
        put :update, params: { id: one_post.to_param, post: { "title_cn" => "invalid value" }}
        expect(assigns(:post)).to eq(one_post)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Post).to receive(:save) { false }
        put :update, params: { id: one_post.to_param, post: { "title_cn" => "invalid value" }}
        expect(response).to render_template("edit")
      end
    end
  end


  describe "DELETE destroy" do
    before { one_post }

    it "destroys the requested post" do
      expect {
        delete :destroy, params: { id: one_post.to_param }
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete :destroy, params: { id: one_post.to_param }
      expect(response).to redirect_to(admin_posts_url)
    end
  end

end
