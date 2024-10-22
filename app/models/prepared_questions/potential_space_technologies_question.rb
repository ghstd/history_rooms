module PreparedQuestions
  class PotentialSpaceTechnologiesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
