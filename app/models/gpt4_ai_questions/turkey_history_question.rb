module Gpt4AiQuestions
  class TurkeyHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
