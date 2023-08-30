# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_many :upvotes, as: :upvotable, dependent: :destroy
  has_many :downvotes, as: :downvotable, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :topics, through: :categorizations

  validates :title, presence: true
  validates :body, presence: true
  validates :topics, presence: { message: "Atleast select 1 topic for your question" }
end
