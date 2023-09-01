# frozen_string_literal: true

class AboutController < ApplicationController
  def index
    # followed topics - Followed Topics
    @followed_topics = current_user.topic_followings.map(&:topic)

    # asked questions - Questions
    @questions = current_user.questions

    # answers to any questions - Answers
    @answers = current_user.answers
  end
end
