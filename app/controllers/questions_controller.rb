# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :check_unauthorization, only: %i[edit update destroy]

  # GET /questions or /questions.json
  def index
    @questions = Question.includes(:user).all.order(likes_count: :DESC)
  end

  # GET /questions/1 or /questions/1.json
  def show; end

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

  def like
    @question = Question.find(params[:id])
    @question.likes.create(user: current_user, is_liked: true)
    @question.update(likes_count: @question.likes.where(is_liked: true).count)
    render json: { likes_count: @question.likes_count }
  end

  def dislike
    @question = Question.find(params[:id])
    @question.likes.create(user: current_user, is_liked: false)
    @question.update(dislikes_count: @question.likes.where(is_liked: false).count)
    render json: { dislikes_count: @question.dislikes_count }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:title, :body)
  end

  def check_unauthorization
    return if @question.user.eql?(current_user)

    redirect_to authenticated_root_path, alert: 'You are not authorized to access this post.'
  end
end
