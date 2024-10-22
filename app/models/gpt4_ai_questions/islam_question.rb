module Gpt4AiQuestions
  class IslamQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
