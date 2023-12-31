# frozen_string_literal: true

class Topic < ApplicationRecord
  include ImagePreviewConcern

  belongs_to :user
  has_many :topic_followings, dependent: :destroy
  has_many :users, through: :topic_followings
  has_many :categorizations, dependent: :destroy
  has_many :questions, through: :categorizations, dependent: :destroy
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image, attached: true,
                    content_type: ['image/png', 'image/jpeg']

end
