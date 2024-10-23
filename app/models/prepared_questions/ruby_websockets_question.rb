module PreparedQuestions
  class RubyWebsocketsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
