module CohereAiQuestions
  class RandomQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
