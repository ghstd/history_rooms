module StudyQuestions
  class RadioSystemsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
