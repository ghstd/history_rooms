module Gpt4AiQuestions
  class RubyOnRailsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
