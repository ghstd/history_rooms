module Gpt4AiQuestions
  class TomBombadilQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
