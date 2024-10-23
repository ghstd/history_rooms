module Gpt4AiQuestions
  class DanishHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
