# frozen_string_literal: true

class CreateTopicFollowings < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_followings do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
