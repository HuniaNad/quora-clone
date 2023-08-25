class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :upvotes, as: :upvotable, dependent: :destroy
  has_many :downvotes, as: :downvotable, dependent: :destroy
  validates :body, presence: true

  scope :top_answers, -> { order(upvotes_count: :desc).limit(2) }
end
