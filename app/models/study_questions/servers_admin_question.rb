module StudyQuestions
  class ServersAdminQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
