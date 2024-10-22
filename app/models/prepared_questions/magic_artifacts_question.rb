module PreparedQuestions
  class MagicArtifactsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
