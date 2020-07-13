class GoalComment < ApplicationRecord
	belongs_to :user
	belongs_to :goal

	validates :comment,  presence: true
end
