module Gpt4AiQuestions
  class RubyQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
