module PreparedQuestions
  class RubyMetaQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
