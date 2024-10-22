module PreparedQuestions
  class RubyMetaQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
