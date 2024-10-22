module CohereAiQuestions
  class RiversQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
