class AnswersController < ApplicationController
    def index
        @answers = Answer.includes(:user).all
    end
    
    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.build(answer_params)
        @answer.user = current_user

        if @answer.save
            redirect_to @question, notice: 'Answer was successfully created.'
        else
            render 'questions/show', status: :unprocessable_entity
        end
    end

    # def destroy 
    #     @post = Post.find(params[:post_id])
    #     @comment = @post.comments.find(params[:id])
    #     @comment.destroy

    #     redirect_to post_path(@post)
    # end

    private

    def answer_params
        params.require(:answer).permit(:body)
    end
end
