module Gpt4AiQuestions
  class RareNationalitiesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
