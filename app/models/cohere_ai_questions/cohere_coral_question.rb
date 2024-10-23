module CohereAiQuestions
  class CohereCoralQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
