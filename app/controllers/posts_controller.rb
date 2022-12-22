class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(posted_on: :desc)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.friendly.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
