module StudyQuestions
  class CodeTestingQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
