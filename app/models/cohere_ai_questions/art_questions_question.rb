module CohereAiQuestions
  class ArtQuestionsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
