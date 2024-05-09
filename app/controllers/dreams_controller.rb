class DreamsController < ApplicationController
  before_action :set_dream, only: %i[show destroy edit update]

  def index
    if params[:search]
      @dreams = Dream.where("content LIKE ?", "%#{params[:search]}%")
    else
      @dreams = Dream.where(user: current_user)
    end
      @dreams.each do |dream|
        dream.set_dream_title if dream.title.nil?
      end
  end

  def new
    @dream = Dream.new
    @labels = Label.all
  end

  def new_audio
    @dream_of_today = Dream.create_with_audio(current_user)
    if params[:audio].present?
      audio_file = params[:audio].tempfile
      transcript = OpenaiService.transcribe(audio_file)
      render json: { transcription: transcript}
    end
  end

  def new_answered_questions
    # Find the dream or create a new one if it doesn't exist
    @dream = Dream.find_by(id: params[:id]) || Dream.create(user: current_user, date: Date.today)

    # Generate the dream content
    generated_content = @dream.generate_content_from_answers

    # Update the dream's content
    @dream.update(content: generated_content)

    redirect_to @dream
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
    # Destroy all dream_labels
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
    @dream.id = params[:id]
    @dream.destroy!
    redirect_to dreams_path, status: :see_other
  end

  def analytics
    @label_counts = Label.joins(:dreams).group('labels.name').count
    @dream_counts = Dream.where(user: current_user).size

  end

  private

  def generate_dream_labels(dream, label_ids)
    unless label_ids.nil?
      label_ids.each do |label_id|
        unless label_id.empty?
          DreamLabel.create(label: Label.find(label_id), dream: dream)
        end
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
