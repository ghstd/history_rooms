module Gpt4AiQuestions
  class OldTestamentQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
