module Gpt4AiQuestions
  class RomanEmpireHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
