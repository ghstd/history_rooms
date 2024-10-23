module Gpt4AiQuestions
  class MythicalLocationsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
