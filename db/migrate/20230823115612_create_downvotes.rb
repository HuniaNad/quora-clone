# frozen_string_literal: true

class CreateDownvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :downvotes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :downvotable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :downvotes, %i[user_id downvotable_type downvotable_id], unique: true,
                                                                       name: 'index_downvotes_on_user_and_downvotable'
  end
end
