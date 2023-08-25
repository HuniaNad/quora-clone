# frozen_string_literal: true

class QuestionPolicy < ApplicationPolicy
  attr_reader :user, :question

  def initialize(user, answer)
    super
    @user = user
    @question = answer
  end

  def update?
    user == question.user
  end

  def destroy?
    user == question.user
  end
end
