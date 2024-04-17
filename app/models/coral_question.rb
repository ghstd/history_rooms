class CoralQuestion < ApplicationRecord
  validates :question, presence: true
  validates :options, presence: true
  validates :answer, presence: true
end
