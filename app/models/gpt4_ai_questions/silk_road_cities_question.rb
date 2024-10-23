module Gpt4AiQuestions
  class SilkRoadCitiesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
