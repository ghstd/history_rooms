module StudyQuestions
  class ServersAdminQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
