class VotesController < ApplicationController
  def upvote
    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])

    if @upvote
      @upvote.destroy
    else
      @upvote = Upvote.create(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  def downvote
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])

    if @downvote
      @downvote.destroy
    else
      Downvote.create(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])
    end
  end

  def upvote_inc_downvote_dec

    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])

    if @downvote
      @downvote.destroy
      @upvote = Upvote.create(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }

  end

  def upvote_dec_downvote_inc

    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: params[:type], upvotable_id: params[:id])
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])

    if @upvote
      @upvote.destroy
      @downvote = Downvote.create(user_id: current_user.id, downvotable_type: params[:type], downvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  private 
  
  def find_vote; end
end
