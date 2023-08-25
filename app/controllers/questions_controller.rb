# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :question, only: %i[show edit update destroy]
  before_action :authorize_access, only: %i[edit update destroy]

  # GET /questions or /questions.json
  def index
    @questions = Question.includes(:user, :answers).all.order(upvotes_count: :DESC)
  end

  # GET /questions/1 or /questions/1.json
  def show
    @popular_answers = @question.answers.order(upvotes_count: :DESC)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions or /questions.json
  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def question
    @question ||= Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :body)
  end

  # Check if user is authorized to access the question
  def authorize_access
    return if @question.user.eql?(current_user)

    redirect_to authenticated_root_path, alert: 'You are not authorized to access this question.'
  end
end
