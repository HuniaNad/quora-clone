# frozen_string_literal: true

class AddPrimaryKeyToDownvotes < ActiveRecord::Migration[5.2]
  def change
    add_column :downvotes, :id, :primary_key
  end
end
