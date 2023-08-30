# frozen_string_literal: true

class TopicFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :topic
end
