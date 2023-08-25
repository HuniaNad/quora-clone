class AnswersController < ApplicationController   

    def index 
        @question = Question.find(params[:question_id])
        @top_answers = @question.answers.order(upvotes_count: :DESC).limit(2)

        render json: @top_answers
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

    def destroy 
        puts "------------->", params.inspect
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])

        if @answer.destroy
            redirect_to @question, notice: 'Answer was successfully created.'
        else
            render 'questions/show', status: :unprocessable_entity
        end
    end

    private

    def answer_params
        params.require(:answer).permit(:body)
    end
end
