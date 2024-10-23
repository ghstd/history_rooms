module Gpt4AiQuestions
  class OttomanEmpireHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
