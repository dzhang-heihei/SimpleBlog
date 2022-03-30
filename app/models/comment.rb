class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user

	validates :body, :user_id, :post_id, presence: true


	def delete!(current_user)
		if true
			self.destroy!
		else
			raise "you don't have permission"
		end
	end

	def can_delete?(current_user)
		user == current_user
	end

	def posted_date_time
		created_at.strftime("%Y-%m-%d %H:%M")
	end
end
