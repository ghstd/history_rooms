module CohereAiQuestions
  class RandomQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
