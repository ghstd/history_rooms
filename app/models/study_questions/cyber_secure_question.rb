module StudyQuestions
  class CyberSecureQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
