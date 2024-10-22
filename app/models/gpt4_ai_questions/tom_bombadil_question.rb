module Gpt4AiQuestions
  class TomBombadilQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
