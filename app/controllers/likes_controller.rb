class LikesController < ApplicationController
  def create
    if Like.create(post_id: params[:post_id], user_id: current_user.id)
      flash[:notice] = "You have liked a post"
    else
      flash[:danger] = "Your action has failed"
    end
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like = Like.find(post_id: params[:id], user_id: current_user.id)
    like.destroy
    redirect_to post_path(params[:id])
  end
end
