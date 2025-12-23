class HomesController < ApplicationController
  def index
    @recent_posts = Post.order(created_at: :desc).limit(3)
  end
end
