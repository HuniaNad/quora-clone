# frozen_string_literal: true

class AddIndexToCategorization < ActiveRecord::Migration[5.2]
  def change
    add_index :categorizations, %i[topic_id question_id], unique: true
    add_index :categorizations, %i[question_id topic_id], unique: true
  end
end
