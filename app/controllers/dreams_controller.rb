class DreamsController < ApplicationController
  before_action :set_dream, only: %i[show destroy edit update]

  def index
    if params[:search]
      @dreams = Dream.where("content LIKE ?", "%#{params[:search]}%")
    else
      @dreams = Dream.where(user: current_user)
    end
  end

  def new
    @dream = Dream.new
  end

  def new_audio
    @dream_of_today = Dream.todays_dream(current_user)
    if params[:audio].present?
      audio_path = params[:audio].tempfile.path
      transcript = OpenaiService.transcribe(audio_path)
      render json: { transcription: transcript}
    end
  end

  def create
    @dream = Dream.new(dream_params)
    @dream.user = current_user
    @dream.date = Date.today
    generate_dream_labels(@dream, params[:dream][:label_ids])
    if @dream.save!
      redirect_to dreams_path, notice: 'Your dream was saved!💭'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    # Destaoy all dream_labels
    @dream.dream_labels.destroy_all
    # Regenerate all the dream_labels
    generate_dream_labels(@dream, params[:dream][:label_ids])
    if @dream.update!(dream_params)
      redirect_to dream_path(@dream)
    else
      render :edit
    end
  end

  def destroy
    @dream.destroy
    redirect_to dreams_path, status: :see_other
  end

  private

  def generate_dream_labels(dream, label_ids)
    label_ids.each do |label_id|
      unless label_id.empty?
        DreamLabel.create(label: Label.find(label_id), dream: dream)
      end
    end
  end

  def set_dream
    @dream = Dream.find(params[:id])
  end

  def dream_params
    params.require(:dream).permit(:content, :label_ids)
  end
end
