module PreparedQuestions
  class MagicArtifactsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
