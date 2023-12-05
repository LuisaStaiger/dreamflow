class Dream < ApplicationRecord
  belongs_to :user
  has_many :dream_questions
  has_many :answers, through: :dream_questions

  default_scope { order(created_at: :desc) }

  def self.todays_dream(current_user)
    dream = Dream.find_by(user: current_user, date:  Time.current.beginning_of_day..Time.current.end_of_day)
    dream || Dream.create(user: current_user, date: Time.current)
  end

  def content
    (super || "") + answers.map(&:user_answer).join(" ")
  end
end

class ApplicationRecord
  def content
    # Provide a default implementation if necessary
    ""
  end
end


