module Gpt4AiQuestions
  class FolkFoodQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
