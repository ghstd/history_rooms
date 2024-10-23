module Gpt4AiQuestions
  class GlobalHistoricalPeriodsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
