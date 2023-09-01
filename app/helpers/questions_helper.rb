# frozen_string_literal: true

module QuestionsHelper
  include AboutHelper
  def select_default_topic(question)
    if question.topics.length.positive?
      question.topics.pluck(:id)
    else
      Topic.first.id
    end
  end

  def answers_exist?(question)
    question.answers.length.positive?
  end

  def generate_topics(question)
    question.topics.map { |topic| topic.title.titlecase }.join(', ')
  end

  def all_topics
    Topic.all
  end
end
