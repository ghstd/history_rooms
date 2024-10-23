module Gpt4AiQuestions
  class TaiwanHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
