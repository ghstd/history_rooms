module PreparedQuestions
  class SpyIntelligenceTechnologyQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
