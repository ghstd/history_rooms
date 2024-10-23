module CohereAiQuestions
  class CitiesQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
