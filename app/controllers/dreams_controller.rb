class DreamsController < ApplicationController
  before_action :set_dream, only: %i[show destroy]

  def index
    @dreams = Dream.all
  end

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

  def destroy
    @dream.destroy
    redirect_to dreams_path, status: :see_other
  end

  private

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:content)
  end

end
