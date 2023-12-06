class Dream < ApplicationRecord
  belongs_to :user
  has_many :dream_questions
  has_many :answers, through: :dream_questions
  has_many :dream_labels
  has_many :labels, through: :dream_labels

  default_scope { order(created_at: :desc) }

  def self.todays_dream(current_user)
    dream = Dream.find_by(user: current_user, date:  Time.current.beginning_of_day..Time.current.end_of_day)
    dream || Dream.create(user: current_user, date: Time.current)
  end

  def content
    (super || "") + answers.map(&:user_answer).join(" ")
  end

  def title
    client = OpenAI::Client.new
    chaptgpt_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{
          role: "user",
          content: "Please generate a short title for this #{content}, not longer than 20 character."
        }]
      })
    return chaptgpt_response["choices"][0]["message"]["content"]
  end
end
