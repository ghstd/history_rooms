module PreparedQuestions
  class AstronomySpaceObjectsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
