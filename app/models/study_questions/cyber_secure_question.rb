module StudyQuestions
  class CyberSecureQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
