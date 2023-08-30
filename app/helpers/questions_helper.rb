# frozen_string_literal: true

module QuestionsHelper
  def select_default_topic(question)
    if question.topics.length.positive?
      question.topics.pluck(:id)
    else
      Topic.first.id
    end
  end
end
