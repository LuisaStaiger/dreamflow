class DreamsController < ApplicationController
  before_action :set_dream, only: %i[show edit]

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    @dream.date = Date.today
    if @dream.save!
      redirect_to root_path, notice: 'Your dream was saved!'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @dream = Dream.new
  end

  def update
    if @dream.update(dream_params)
    redirect_to dream_path(@dream)
    else
      render :edit
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:content)
  end

end
