class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :upvotes, as: :upvotable, dependent: :destroy
  has_many :downvotes, as: :downvotable, dependent: :destroy
  validates :body, presence: true
end
