module StudyQuestions
  class RadioSystemsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
