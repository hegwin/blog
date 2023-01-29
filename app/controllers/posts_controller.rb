class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.online.order(posted_on: :desc).includes(:tags).page(params[:page]).without_count
    if params[:tag].present?
      @posts = @posts.tagged_with(params[:tag])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.friendly.includes(:tags).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end
