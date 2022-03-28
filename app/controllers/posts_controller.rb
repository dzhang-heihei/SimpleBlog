class PostsController < ApplicationController
    before_action :set_post, only: [:show, :destroy]

    def index
      @posts = Post.order(created_at: :desc)

      respond_to do |format|
        format.html
      end
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
      if @post.destroy!
        redirect_to posts_path
      else
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