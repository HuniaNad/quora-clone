# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :question, only: %i[index create destroy]

  def index
    @top_answers = @question.answers.top_answers

    render json: @top_answers.to_json(include: :user)
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: t(:create_success)
    else
      redirect_to @question, alert: t(:create_fail)
    end
  end

  def destroy
    @answer ||= @question.answers.find_by(id: params[:id])
    authorize @answer

    if @answer.destroy
      redirect_to @question, notice: t(:delete_success)
    else
      flash.now[:alert] = t(:delete_fail)
      render question
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def question
    @question ||= Question.includes(:user, :answers).find_by(id: params[:question_id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body)
  end
end
