class LabelsController < ApplicationController

  def index
    @labels = Label.all
  end

end
