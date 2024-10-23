module PreparedQuestions
  class WorldConflictsResolutionQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
