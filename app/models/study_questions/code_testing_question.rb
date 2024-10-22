module StudyQuestions
  class CodeTestingQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
