module CohereAiQuestions
  class CohereCoralQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
