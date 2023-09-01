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
  validate :at_least_one_topic

  def thumbnail
    image.variant(resize: '50x50').processed
  end

  private

  def at_least_one_topic
    errors.add(:base, 'At least one topic must be selected') if topic_ids.empty?
  end
end
