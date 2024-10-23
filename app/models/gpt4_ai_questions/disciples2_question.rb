module Gpt4AiQuestions
  class Disciples2Question < ApplicationRecord
    serialize :options, coder: JSON
  end
end
