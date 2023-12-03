class Question < ApplicationRecord
  belongs_to :user
  has_many :dream_questions
  validates_presence_of :question_text
end
