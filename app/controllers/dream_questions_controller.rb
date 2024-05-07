class DreamQuestionsController < ApplicationController
  def create
    @dream_question = DreamQuestion.create(dream_question_params)
    Answer.create(dream_question: @dream_question, user_answer: params.dig(:answer, :user_answer))
    redirect_to questions_path
  end

  private

  def dream_question_params
    params.require(:answer).permit(:dream_id, :question_id)
  end

end
