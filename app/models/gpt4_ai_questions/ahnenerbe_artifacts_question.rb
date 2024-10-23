module Gpt4AiQuestions
  class AhnenerbeArtifactsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
