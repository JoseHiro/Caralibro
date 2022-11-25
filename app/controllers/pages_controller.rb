class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @posts = Post.where(user_id: current_user)
    # following users.posts
  end

  def contact
  end
end
