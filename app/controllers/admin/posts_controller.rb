class Admin::PostsController < Admin::BaseController
    before_action :set_post, only: [:edit, :update, :destroy]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to admin_posts_path, notice: 'Article créé avec succès.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to admin_posts_path, notice: 'Article mis à jour avec succès.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Article supprimé avec succès.'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
  end