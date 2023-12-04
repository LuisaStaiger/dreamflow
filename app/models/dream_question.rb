class DreamQuestion < ApplicationRecord
  has_one :answer
  belongs_to :dream
  belongs_to :question
end
