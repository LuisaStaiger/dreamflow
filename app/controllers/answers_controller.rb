class AnswersController < ApplicationController
  def create; end

  def update
    dream = Dream.todays_dream(current_user)
    answer = Answer.find(params[:id])
    answer.update(answer_params)

    head :ok
  end

  def answer_params
    params.require(:answer).permit(:user_answer)
  end
end
