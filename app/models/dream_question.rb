class DreamQuestion < ApplicationRecord
  has_one :answer, dependent: :destroy
  belongs_to :dream
  belongs_to :question
end
