# frozen_string_literal: true

class Upvote < ApplicationRecord
  belongs_to :user
  belongs_to :upvotable, polymorphic: true
end
