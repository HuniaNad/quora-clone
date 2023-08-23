class AddCountsToQuestions < ActiveRecord::Migration[5.2]
  def change
    change_table :questions, bulk: true do |t|
      t.integer :upvotes_count, null: false, default: 0
      t.integer :downvotes_count, null: false, default: 0
    end
  end
end
