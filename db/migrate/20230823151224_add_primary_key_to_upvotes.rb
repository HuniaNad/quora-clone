# frozen_string_literal: true

class AddPrimaryKeyToUpvotes < ActiveRecord::Migration[5.2]
  def change
    add_column :upvotes, :id, :primary_key
  end
end
