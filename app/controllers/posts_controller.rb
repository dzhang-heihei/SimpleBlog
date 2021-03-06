class PostsController < ApplicationController
    before_action :authenticate_user!    
    before_action :set_post, only: [:show, :destroy]

    def index
      @posts = Post.readable_for_all.order(created_at: :desc)
    end

    def show
    end

    def new
      @post = Post.new
    end


    def create
      @post = Post.new(post_params)
      @post.user = current_user

      if @post.save
        redirect_to posts_path, notice: "Post saved!"
      else
        render "new"
      end
    end

    def destroy
      if @post.delete!(current_user)
        redirect_to posts_path
      end
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :title,
        :body
      )
    end
  end