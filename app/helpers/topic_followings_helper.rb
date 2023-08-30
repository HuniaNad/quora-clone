# frozen_string_literal: true

module TopicFollowingsHelper
  def user_followed?(topic, current_user)
    current_user.topics.exists?(topic.id)
  end
end
