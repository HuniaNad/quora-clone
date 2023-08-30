# frozen_string_literal: true

require 'test_helper'

class TopicFollowingsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create_or_destroy' do
    get topic_followings_create_or_destroy_url
    assert_response :success
  end
end
