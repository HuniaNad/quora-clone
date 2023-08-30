# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :question, only: %i[show edit update destroy]
  before_action :topics, only: %i[new edit create]
  before_action :authorize_access, only: %i[edit update destroy]

  # GET /questions
  def index
    @questions = Question.includes(:user, :answers, :topics).joins(topics: :topic_followings)
                         .where(topic_followings: { user_id: current_user.id })
                         .order(upvotes_count: :desc).distinct
  end

  # GET /questions/1
  def show
    @popular_answers = @question.answers.order(upvotes_count: :DESC)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  def create
    @question = current_user.questions.build(question_params)

    if @question.save
      save_question_topics
      redirect_to question_url(@question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      # Delete existing categorizations for this question
      @question.categorizations.destroy_all

      # Create new categorizations for the selected topics
      save_question_topics
      redirect_to question_url(@question), notice: 'Question was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    if @question.destroy
      redirect_to questions_url, notice: 'Question was successfully destroyed.'
    else
      flash.now[:alert] = 'Question was not able to be destroyed.'
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def question
    @question ||= Question.includes(:user, :answers, :topics).find_by(id: params[:id])
  end

  # Callback to share common setup or constraints between actions.
  def topics
    @topics ||= Topic.pluck(:title, :id).to_h
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :body)
  end

  # Check if user is authorized to access the question
  def authorize_access
    authorize @question
  end

  def save_question_topics
    params[:topics]&.each do |topic_id|
      @question.categorizations.create(topic_id: topic_id)
    end
  end
end
