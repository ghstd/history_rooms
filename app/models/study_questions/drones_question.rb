module StudyQuestions
  class DronesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
