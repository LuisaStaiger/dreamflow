class Dream < ApplicationRecord
  belongs_to :user
  belongs_to :dream_question, optional: true
end
