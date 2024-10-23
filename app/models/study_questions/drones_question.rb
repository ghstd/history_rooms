module StudyQuestions
  class DronesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
