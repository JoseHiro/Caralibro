class UsersController < ApplicationController
  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id] || params[:format])
    @all_post = @user.posts
  end

  def followings
    user = User.find(params[:id])
    @user = user.followings
  end

  def followers
    user = User.find(params[:id])
    @user = user.followers
  end

  private

  def params_user
    params.require(:user).permit(:id)
  end
end
