class Answer < ApplicationRecord
  # has_many :dream_questions
  belongs_to :dream_question
end
