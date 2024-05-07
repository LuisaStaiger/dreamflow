class Dream < ApplicationRecord
  belongs_to :user
  has_many :dream_questions, dependent: :destroy
  has_many :answers, through: :dream_questions, dependent: :destroy
  has_many :dream_labels, dependent: :destroy
  has_many :labels, through: :dream_labels

  default_scope { order(created_at: :desc) }

  def self.todays_dream(current_user)
    dream = Dream.find_by(user: current_user, date:  Time.current.beginning_of_day..Time.current.end_of_day)
    dream || Dream.create(user: current_user, date: Time.current)
    Rails.logger.info "todays_dream called with user: #{current_user.inspect}, dream: #{dream.inspect}"
  dream
  end

  def set_dream_title
    client = OpenAI::Client.new
    gpt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{
          role: "user",
          content: "Please generate a short title for this #{content}, not longer than 20 character."
        }]
      })
    new_title = gpt_response&.dig("choices", 0, "message", "content")
    new_title = "Your Dream" if new_title.nil?
    update(title: new_title) if new_title
    return new_title
  end

  def generate_content_from_answers
    # Collect all answers from this dream

    answers_content = self.dream_questions.map do |dq|
      "#{dq.question.question_text}: #{dq.answer&.user_answer}" if dq.answer
    end.compact

    # Set up the OpenAI client
    client = OpenAI::Client.new
    # Call the OpenAI API
    gpt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{
          role: "user",
          content: "Please generate a very short dream based on these questions and answers that is not adding anything that wasnt mentioned: #{answers_content.join(', ')}"
        }]
      })

    generated_content = gpt_response&.dig("choices", 0, "message", "content")
    if generated_content.nil?
      generated_content = answers_content.join(', ')
    end
    # Return the generated content
    generated_content
  end

end
