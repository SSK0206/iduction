class Post < ApplicationRecord
	belongs_to :user

	has_many :likes, dependent: :destroy
	has_many :like_user, through: :likes, source: :user
	has_many :comments, dependent: :delete_all

	validates :user_id, presence: true
	validates :content, presence: true, length: { maximum: 1000 }


	

	#ポストにいいねをする
	def create_like(user)
		likes.create(user_id: user.id)
	end

	#ポストにいいねを消す
	def destroy_like(user)
		likes.find_by(user_id: user.id).destroy
	end

	def like?(user)
		like_user.include?(user)
	end
	
end
