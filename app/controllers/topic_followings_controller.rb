# frozen_string_literal: true

class TopicFollowingsController < ApplicationController
  def create_or_destroy
    find_follow

    @follow ? @follow.destroy : add_follow

    render json: { follow_count: topic_followings }
  end

  private

  def find_follow
    @follow = TopicFollowing.find_by(topic_id: params[:id], user_id: current_user.id)
  end

  def add_follow
    @follow = current_user.topic_followings.create(topic_id: params[:id])
  end

  def topic_followings
    @topic ||= Topic.find_by(id: params[:id])
    @topic.topic_followings.count
  end
end
