module PreparedQuestions
  class RubyClassesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
