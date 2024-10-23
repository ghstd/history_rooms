module PreparedQuestions
  class PotentialSpaceTechnologiesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
