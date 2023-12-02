class QuestionsController < ApplicationController

  def index
    # @questions = Question.all
    # @answer = Answer.new
    @dream_questions = DreamQuestion.all
  end


  def new
    @question = Question.new

  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    @question.correct = false

    if @question.save!
      redirect_to questions_path, notice: 'Your question was saved!'
    else
      render :new
    end
  end


  def show
    set_question
  end

  def edit
  end

  def destroy

    @question.destroy
    redirect_to questions_path, status: :see_other
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question_text)
  end
end
