class AddDislikesCountToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :dislikes_count, :integer, default: 0, null: false
  end
end
