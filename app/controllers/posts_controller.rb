class PostsController < ApplicationController
  before_action :setup_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.creator = User.first # TODO: change once we have authentication

    if @post.save
      flash[:notice] = 'You created a post!'
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      flash[:notice] = 'You edited a post!'
      redirect_to post_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def setup_post
    @post = Post.find params[:id]
  end
end
