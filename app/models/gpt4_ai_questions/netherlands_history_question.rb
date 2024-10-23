module Gpt4AiQuestions
  class NetherlandsHistoryQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
