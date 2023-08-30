# frozen_string_literal: true

class Categorization < ApplicationRecord
  belongs_to :question
  belongs_to :topic
end
