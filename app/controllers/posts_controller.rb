class PostsController < ApplicationController
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post créé avec succès.'
      else
        render :new
      end
    end
  
    def show
      @post = Post.find(params[:id])
      @next_post = Post.where("created_at > ?", @post.created_at).order(created_at: :asc).first
      @previous_post = Post.where("created_at < ?", @post.created_at).order(created_at: :desc).first
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
  end