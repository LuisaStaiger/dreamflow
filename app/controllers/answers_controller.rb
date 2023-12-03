class AnswersController < ApplicationController
  def create; end

  def update
    answer = Answer.find(params[:id])
    answer.update!(answer_params)
    redirect_to questions_path
  end

  def answer_params
    params.require(:answer).permit(:user_answer)
  end
end