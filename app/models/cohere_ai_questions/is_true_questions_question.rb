module CohereAiQuestions
  class IsTrueQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
