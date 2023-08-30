# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.add_column :name, :string, null: false, default: ''
      t.add_column :username, :string, null: false, default: ''
      t.add_column :age, :integer, null: false, default: 18
      t.add_column :gender, :string, null: false, default: ''
    end
  end
end
