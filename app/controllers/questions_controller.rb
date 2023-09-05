# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :question, only: %i[show edit update destroy]
  before_action :authorize_access, only: %i[edit update destroy]

  def index
    @questions = Question.includes(:user, :answers, :topics)
                         .joins(topics: :topic_followings)
                         .where(topic_followings: { user_id: current_user.id })
                         .order(upvotes_count: :desc)
                         .distinct
                         .page(params[:page]).per(10)
  end

  def show
    @popular_answers = @question.answers.order(upvotes_count: :DESC).page(params[:page]).per(5)
  end

  def new
    @question = Question.new
  end

  def edit; end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to question_url(@question), notice: t(:create_success)
    else
      flash.now[:alert] = t(:create_fail)
      render :new
    end
  end

  def update
    if @question.update(question_params)

      redirect_to question_url(@question), notice: t(:update_success)
    else
      flash.now[:alert] = t(:update_fail)
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_url, notice: t(:delete_success)
    else
      flash.now[:alert] = t(:delete_fail)
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def question
    @question ||= Question.includes(:user, :answers, :topics).find(params[:id])
  end

  # Check if user is authorized to access the question
  def authorize_access
    authorize @question
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :body, topic_ids: [])
  end
end
