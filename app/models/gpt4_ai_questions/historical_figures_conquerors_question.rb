module Gpt4AiQuestions
  class HistoricalFiguresConquerorsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
