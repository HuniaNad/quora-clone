class CreateLike < ActiveRecord::Migration[5.2]
  def change
    create_table :likes, id: false do |t|
      t.boolean :is_liked, null: false, default: true
      t.references :likable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
