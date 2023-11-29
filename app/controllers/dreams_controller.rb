class DreamsController < ApplicationController
  before_action :set_dream, only: %i[]

  def new
    @dream = Dream.new
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    raise
    if @dream.save!
      redirect_to root_path, notice: 'Your dream was saved!'
    else
      render :new
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
