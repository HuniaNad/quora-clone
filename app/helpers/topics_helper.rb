# frozen_string_literal: true

module TopicsHelper
  def topic_followings(topic)
    topic.topic_followings.count
  end
end
