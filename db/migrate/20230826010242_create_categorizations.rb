# frozen_string_literal: true

class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.references :question, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
