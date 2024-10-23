module Gpt4AiQuestions
  class SomaliaHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
