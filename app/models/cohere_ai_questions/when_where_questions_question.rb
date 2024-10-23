module CohereAiQuestions
  class WhenWhereQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
