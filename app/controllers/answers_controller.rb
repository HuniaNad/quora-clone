class AnswersController < ApplicationController
    before_action :set_question, only: %i[index create destroy]

    def index
        @top_answers = @question.answers.includes(:user).order(upvotes_count: :DESC).limit(2)

        render json: @top_answers.to_json(include: :user)
    end
    
    def create
        @answer = @question.answers.build(answer_params)
        @answer.user = current_user

        if @answer.save
            redirect_to @question, notice: 'Answer was successfully created.'
        else
            render 'questions/show', status: :unprocessable_entity
        end
    end

    def destroy
        @answer = @question.answers.find(params[:id])

        if @answer.destroy
            redirect_to @question, notice: 'Answer was successfully created.'
        else
            render 'questions/show', status: :unprocessable_entity
        end
    end

    private

    # Callback to share common setup or constraints between actions.
    def set_question
        @question = Question.includes(:user, :answers).find(params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
        params.require(:answer).permit(:body)
    end
end
