module Gpt4AiQuestions
  class Heroes3Question < ApplicationRecord
    serialize :options, coder: JSON
  end
end
