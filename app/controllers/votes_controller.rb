class VotesController < ApplicationController
  def upvote
    type = 'Question'
    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: type, upvotable_id: params[:id])

    if @upvote
      @upvote.destroy
    else
      @upvote = Upvote.create(user_id: current_user.id, upvotable_type: type, upvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  def downvote
    type = 'Question'
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: type, downvotable_id: params[:id])

    if @downvote
      @downvote.destroy
    else
      Downvote.create(user_id: current_user.id, downvotable_type: type, downvotable_id: params[:id])
    end
  end

  def upvote_inc_downvote_dec
    type = 'Question'

    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: type, upvotable_id: params[:id])
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: type, downvotable_id: params[:id])

    if @downvote
      @downvote.destroy
      @upvote = Upvote.create(user_id: current_user.id, upvotable_type: type, upvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }

  end

  def upvote_dec_downvote_inc
    type = 'Question'

    @upvote = Upvote.find_by(user_id: current_user.id, upvotable_type: type, upvotable_id: params[:id])
    @downvote = Downvote.find_by(user_id: current_user.id, downvotable_type: type, downvotable_id: params[:id])

    if @upvote
      @upvote.destroy
      @downvote = Downvote.create(user_id: current_user.id, downvotable_type: type, downvotable_id: params[:id])
    end

    render json: { upvotes_count: @upvote.upvotable.upvotes_count }
  end

  private 
  
  def find_vote; end
end
