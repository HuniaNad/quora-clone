# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    # user info - About
    @user = current_user

    # followed topics - Followed Topics
    @followed_topics = @user.topic_followings.map(&:topic)

    # asked questions - Questions
    @questions = @user.questions

    # answers to any questions - Answers
    @answers = @user.answers
  end
end
