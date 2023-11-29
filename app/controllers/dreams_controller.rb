class DreamsController < ApplicationController
  before_action :set_dream, only: %i[new create]

  def new
    @dreams = Dream.new
  end

  def create
    if @dreams.save!
      redirect to #homepage
    else
      render 'new'
    end
  end

  private

  def set_dream
    @dream = Dream.find(params[:dream_id])
  end

  def dream_params
    params.require(:dream).permit("we need to update before we can update the drams params.")
  end

end
