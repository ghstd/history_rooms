module CohereAiQuestions
  class WhoSaidQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
