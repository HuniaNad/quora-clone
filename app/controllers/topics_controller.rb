# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :topic, only: %i[show edit update]
  before_action :authorize_access, only: %i[edit update]

  def index
    @topics = Topic.includes(:user).all.page(params[:page]).per(6)
  end

  def show
    @associated_questions = @topic.questions.order(upvotes_count: :DESC).page(params[:page]).per(10)
  end

  def new
    @topic = Topic.new
  end

  def edit; end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topic_url(@topic), notice: t(:create_success)
    else
      flash.now[:alert] = t(:create_fail)
      render :new
    end
  end

  def update
    if @topic.update(topic_params)
      redirect_to topic_url(@topic), notice: t(:update_success)
    else
      flash.now[:alert] = t(:update_fail)
      render :edit
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def topic
    @topic ||= Topic.includes(:user).find(params[:id])
  end

  # Check if user is authorized to access the topic
  def authorize_access
    authorize @topic
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:title, :description, :image)
  end
end
