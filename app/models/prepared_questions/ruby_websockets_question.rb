module PreparedQuestions
  class RubyWebsocketsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
