class DreamQuestion < ApplicationRecord
  belongs_to :answer, optional: true
  belongs_to :question
end
