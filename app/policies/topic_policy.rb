# frozen_string_literal: true

class TopicPolicy < ApplicationPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    super
    @user = user
    @topic = topic
  end

  def update?
    user == topic.user
  end
end
