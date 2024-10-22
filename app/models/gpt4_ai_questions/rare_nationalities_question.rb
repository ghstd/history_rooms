module Gpt4AiQuestions
  class RareNationalitiesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
