require 'spec_helper'

describe PostsController do

  let(:post) { create :post }

  describe "GET index" do
    it "assigns all posts as @posts order by post time" do
      earlier_post = create :post, posted_on: Time.now - 10.days
      get :index
      assigns(:posts).should eq([post, earlier_post])
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      get :show, {:id => post.to_param}
      assigns(:post).should eq(post)
    end
  end

end
