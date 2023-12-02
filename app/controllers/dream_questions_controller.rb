class DreamQuestionsController < ApplicationController
  def create_dream_from_answers
    # Code that generates new dream from answers from the questions
  end

  def create


      @dream_question = DreamQuestion.find(params[:answer][:dream_question])
      @answer = Answer.create(user_answer: params[:answer][:user_answer])

      @dream_question.update(answer:@answer)

      @dream = Dream.create(user: current_user, dream_question: @dream_question, date: Date.today )
      redirect_to dream_path(@dream)


  end
end
