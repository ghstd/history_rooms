module Gpt4AiQuestions
  class RubyOnRailsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
