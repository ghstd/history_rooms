module CohereAiQuestions
  class SurvivalQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
