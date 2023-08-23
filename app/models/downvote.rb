# frozen_string_literal: true

class Downvote < ApplicationRecord
  belongs_to :user
  belongs_to :downvotable, polymorphic: true
end
