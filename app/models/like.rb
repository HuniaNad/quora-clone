# frozen_string_literal: true

class Like < ApplicationRecord
    belongs_to :likable, polymorphic: true
end
  