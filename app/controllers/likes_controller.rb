class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    # go back to the previous page, if not to the home page
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
