module Gpt4AiQuestions
  class RubyQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
