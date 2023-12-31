# frozen_string_literal: true

class VotesController < ApplicationController
  def upvote
    find_upvote

    @upvote ? @upvote.destroy : add_upvote

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  def downvote
    find_downvote

    @downvote ? @downvote.destroy : add_downvote
  end

  def upvote_inc_downvote_dec
    find_upvote
    find_downvote

    if @downvote
      @downvote.destroy
      add_upvote if @downvote.destroyed?
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  def upvote_dec_downvote_inc
    find_upvote
    find_downvote

    if @upvote
      @upvote.destroy
      add_downvote if @upvote.destroyed?
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  private

  def find_upvote
    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
  end

  def find_downvote
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])
  end

  def add_upvote
    @upvote = Upvote.create(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
  end

  def add_downvote
    @downvote = Downvote.create(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])
  end
end
