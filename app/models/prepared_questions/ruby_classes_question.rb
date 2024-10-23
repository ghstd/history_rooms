module PreparedQuestions
  class RubyClassesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
