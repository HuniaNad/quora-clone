# frozen_string_literal: true

class AnswerPolicy < ApplicationPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    super
    @user = user
    @answer = answer
  end

  def destroy?
    user == answer.user
  end
end
