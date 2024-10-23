module CohereAiQuestions
  class RiversQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
