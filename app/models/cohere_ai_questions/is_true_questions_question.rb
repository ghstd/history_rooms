module CohereAiQuestions
  class IsTrueQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
