class Label < ApplicationRecord
  has_many :dream_labels
  has_many :dreams, through: :dream_labels
end
