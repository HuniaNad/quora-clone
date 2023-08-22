# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true
end
