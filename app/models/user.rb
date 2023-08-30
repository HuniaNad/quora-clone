# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
  has_many :topic_followings, dependent: :destroy
  has_many :topics, through: :topic_followings


  validates :name, presence: true
  validates :username, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  validates :gender, presence: true
  validates :image, attached: true, content_type: ['image/png', 'image/jpeg']
end
