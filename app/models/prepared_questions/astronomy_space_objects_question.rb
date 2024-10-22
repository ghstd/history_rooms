module PreparedQuestions
  class AstronomySpaceObjectsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
