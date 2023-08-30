# frozen_string_literal: true

class AddIndexToTopicsTitle < ActiveRecord::Migration[5.2]
  def change
    add_index :topics, :title, unique: true
  end
end
