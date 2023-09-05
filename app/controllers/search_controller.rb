# frozen_string_literal: true

class SearchController < ApplicationController
  def suggestions
    suggestions = Topic.where('lower(title) ILIKE ?', "%#{params[:topics]}%")
    render json: suggestions.map { |topic| { title: topic.title, id: topic.id } }
  end

  def show
    @topic = Topic.includes(:questions).find(params[:id])
    @questions = @topic.questions.includes(:user, :answers).order(upvotes_count: :desc)
    
  rescue ActiveRecord::RecordNotFound
    redirect_to authenticated_root_path, alert: t(:topic_not_found)
  end
end
