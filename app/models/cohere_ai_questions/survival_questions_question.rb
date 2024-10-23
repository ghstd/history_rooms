module CohereAiQuestions
  class SurvivalQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
