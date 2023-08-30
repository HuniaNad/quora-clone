# frozen_string_literal: true

class AddIndexToTopicFollowings < ActiveRecord::Migration[5.2]
  def change
    add_index :topic_followings, %i[topic_id user_id], unique: true
    add_index :topic_followings, %i[user_id topic_id], unique: true
  end
end
