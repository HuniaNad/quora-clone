# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :question, only: %i[index create destroy]

  def index
    @top_answers = @question.answers.includes(:user).order(upvotes_count: :DESC).limit(2)

    render json: @top_answers.to_json(include: :user)
  end

  def create
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user
    authorize @answer

    if @answer.save
      redirect_to @question, notice: 'Answer was successfully created.'
    else
      render 'questions/show', status: :unprocessable_entity
    end
  end

  def destroy
    @answer ||= @question.answers.find_by(id: params[:id])
    authorize @answer

    if @answer.destroy
      redirect_to @question, notice: 'Answer was successfully deleted.'
    else
      render 'questions/show', status: :unprocessable_entity
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