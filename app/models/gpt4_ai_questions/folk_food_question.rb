module Gpt4AiQuestions
  class FolkFoodQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
