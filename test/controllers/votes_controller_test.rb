require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  test "should get upvote_inc" do
    get votes_upvote_inc_url
    assert_response :success
  end

  test "should get upvote_dec" do
    get votes_upvote_dec_url
    assert_response :success
  end

  test "should get downvote_inc" do
    get votes_downvote_inc_url
    assert_response :success
  end

  test "should get downvote_dec" do
    get votes_downvote_dec_url
    assert_response :success
  end

  test "should get upvote_inc_downvote_dec" do
    get votes_upvote_inc_downvote_dec_url
    assert_response :success
  end

  test "should get upvote_dec_downvote_inc" do
    get votes_upvote_dec_downvote_inc_url
    assert_response :success
  end

end
