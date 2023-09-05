# frozen_string_literal: true

module DeviseHelper
  include AboutHelper
  
  def fetch_answered_questions(user)
    return unless user.answers

    user.answers.uniq(&:question_id)
  end

  def populate_genders
    User.genders.keys.map { |k| [k.humanize, k] }
  end
end
