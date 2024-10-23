module CohereAiQuestions
  class CohereStandartQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
