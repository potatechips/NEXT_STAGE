class Task < ApplicationRecord
  belongs_to :goal

  validates :title, presence: { message: "入力してください"}
end
