module Gpt4AiQuestions
  class MythologicalCreaturesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
