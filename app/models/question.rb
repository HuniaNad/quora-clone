# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_many :upvotes, as: :upvotable, dependent: :destroy
  has_many :downvotes, as: :downvotable, dependent: :destroy
  has_many :answers, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end
