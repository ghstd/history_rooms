module Gpt4AiQuestions
  class TurkeyHistoryQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
