class CommentsController < ApplicationController
	before_action :authenticate_user!
	
	before_action :set_post, only: [:index, :create]
	before_action :new_comment, only: [:index]

	def index
		@comments = @post.comments.order(created_at: :asc)
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = @post.comments.new(comment_params)
		@comment.user = current_user

		if @comment.save!
			redirect_to post_comments_path, notice: "Post saved!"
		else
			render "index"
		end
	end

	def delete
	end

	private

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def new_comment
		@comment = Comment.new
	end

	def comment_params
		params.require(:comment).permit(
			:user_id,
			:body
		)
	end
end