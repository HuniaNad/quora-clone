# frozen_string_literal: true

class TopicsController < ApplicationController
  before_action :topic, only: %i[show edit update]
  before_action :authorize_access, only: %i[edit update]

  # GET /topics
  def index
    @topics = Topic.includes(:user).all
  end

  # GET /topics/1
  def show
    @associated_questions = @topic.questions.order(upvotes_count: :DESC).page(params[:page]).per(10)
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit; end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if topic_exists?
      flash.now[:alert] = 'A similar topic already exists.'
      render :new
    else
      @topic.user = current_user
      if @topic.save
        redirect_to topic_url(@topic), notice: 'Topic was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      redirect_to topic_url(@topic), notice: 'Topic was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Callback to share common setup or constraints between actions.
  def topic
    @topic ||= Topic.includes(:user).find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def topic_params
    params.require(:topic).permit(:title, :description, :image)
  end

  # Check if user is authorized to access the topic
  def authorize_access
    authorize @topic
  end

  def topic_exists?
    Topic.where('lower(title) ILIKE ?', "%#{topic_params[:title]}%").any?
  end
end
