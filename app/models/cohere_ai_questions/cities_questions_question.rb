module CohereAiQuestions
  class CitiesQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
