module CohereAiQuestions
  class WhenWhereQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
