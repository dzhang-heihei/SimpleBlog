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

	def delete!(current_user)
		if can_delete?(current_user)
			self.destroy!
		else
			raise "You don't have permission!"
		end
	end

	def can_delete?(current_user)
		user == current_user
	end
end
