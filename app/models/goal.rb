class Goal < ApplicationRecord
	belongs_to :user
	has_many :tasks
	has_many :favorites, dependent: :destroy
	has_many :goal_comments, dependent: :destroy

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    validates :content,
    presence: { message: "入力してください"},
    length:   {minimum: 3, message: "短すぎます(3文字以上から)"}
end
