module Gpt4AiQuestions
  class IslamQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
