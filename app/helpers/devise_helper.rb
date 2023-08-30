# frozen_string_literal: true

module DeviseHelper
  def fetch_answered_questions(user)
    return unless user.answers

    user.answers.uniq(&:question_id)
  end
end
