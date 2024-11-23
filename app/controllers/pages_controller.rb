class PagesController < ApplicationController
  def home
    @posts = Post.with_attached_image.order(created_at: :desc)
  end
end
