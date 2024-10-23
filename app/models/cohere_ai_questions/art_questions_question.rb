module CohereAiQuestions
  class ArtQuestionsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
