require 'spec_helper'

describe Admin::PostsController do
  
  before do
    user = create :user
    session[:user_id] = user.id
  end

  let(:one_post) { create :post }
  let(:valid_attributes) { { "title_cn" => "MyString", "title_en" => "Title", "body" => "Some texts." } }

  describe "GET index" do
    it "assigns all posts as @posts" do
      get :index
      assigns(:posts).should eq([one_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, {:id => one_post.to_param}
      assigns(:post).should eq(one_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      get :new
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      get :edit, {:id => one_post.to_param}
      assigns(:post).should eq(one_post)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {:post => valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes}
        response.should redirect_to([:admin, Post.last])
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title_cn" => "invalid value" }}
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title_cn" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested post" do
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update_attributes).with({ "title_cn" => "MyString" })
        put :update, {:id =>one_post.to_param, :post => { "title_cn" => "MyString" }}
      end

      it "assigns the requested post as @post" do
        put :update, {:id => one_post.to_param, :post => valid_attributes}
        assigns(:post).should eq(one_post)
      end

      it "redirects to the post" do
        put :update, {:id => one_post.to_param, :post => valid_attributes}
        one_post.reload
        response.should redirect_to admin_post_path(one_post)
      end
    end

    describe "with invalid params" do
      it "assigns the post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => one_post.to_param, :post => { "title_cn" => "invalid value" }}
        assigns(:post).should eq(one_post)
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => one_post.to_param, :post => { "title_cn" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      pending "Undesined"
      expect {
        delete :destroy, {:id => one_post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      pending "UNdesigned"
      post = Post.create! valid_attributes
      delete :destroy, {:id => one_post.to_param}, valid_session
      response.should redirect_to(posts_url)
    end
  end

end
