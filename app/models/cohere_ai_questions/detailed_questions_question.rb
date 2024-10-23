module CohereAiQuestions
  class DetailedQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
