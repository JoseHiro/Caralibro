class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user)
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
