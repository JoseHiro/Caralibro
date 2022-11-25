class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id] || params[:format])
    @all_post = @user.posts
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def setting
    @user = User.find(params[:id] || params[:format])
  end

  private

  def params_user
    params.require(:user).permit(:id, :photo)
  end
end
