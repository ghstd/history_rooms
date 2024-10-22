module CohereAiQuestions
  class WhoSaidQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
