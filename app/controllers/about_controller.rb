# frozen_string_literal: true

class AboutController < ApplicationController
  def followed_topics
    @followed_topics = Topic.joins(:topic_followings)
                            .where(topic_followings: { user_id: current_user.id })
                            .page(params[:page])
                            .per(6)
  end

  def questions
    @questions = current_user.questions.page(params[:page]).per(6)
  end

  def answers
    @answers = current_user.answers.page(params[:page]).per(6)
  end
end
