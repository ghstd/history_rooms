module PreparedQuestions
  class RubyExeptionsBlocksQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
