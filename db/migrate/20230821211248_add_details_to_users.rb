# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ''
    add_column :users, :username, :string, null: false, default: ''
    add_column :users, :age, :integer, null: false, default: 18
    add_column :users, :gender, :string, null: false, default: ''
  end
end
