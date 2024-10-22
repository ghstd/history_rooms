module CohereAiQuestions
  class CohereStandartQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
