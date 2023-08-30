# frozen_string_literal: true

class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
