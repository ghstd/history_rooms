module PreparedQuestions
  class SpyIntelligenceTechnologyQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
