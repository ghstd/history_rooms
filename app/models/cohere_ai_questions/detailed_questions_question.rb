module CohereAiQuestions
  class DetailedQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
