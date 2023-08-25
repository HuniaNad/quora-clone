# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :image
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :downvotes, dependent: :destroy
end
