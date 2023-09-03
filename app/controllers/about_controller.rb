# frozen_string_literal: true

class AboutController < ApplicationController

  def followed_topics
    # followed topics - Followed Topics
    @followed_topics = Topic.joins(:topic_followings)
                            .where(topic_followings: { user_id: current_user.id })
                            .page(params[:page])
                            .per(6)
  end

  def questions
    # asked questions - Questions
    @questions = current_user.questions.page(params[:page]).per(6)
  end

  def answers
    # answers to any questions - Answers
    @answers = current_user.answers.page(params[:page]).per(6)
  end
end
