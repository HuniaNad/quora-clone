# frozen_string_literal: true

class CreateUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :upvotes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :upvotable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :upvotes, %i[user_id upvotable_type upvotable_id], unique: true,
                                                                 name: 'index_upvotes_on_user_and_upvotable'
  end
end
