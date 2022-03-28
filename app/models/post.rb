class Post < ApplicationRecord
	belongs_to :user
	has_many :comments

	validates :title, :body, :user_id, presence: true


	def post_author
		user.name
	end

	def posted_date_time
		created_at.strftime("%Y-%m-%d %H:%M")
	end

	def comments_number
		comments.size
	end
end
