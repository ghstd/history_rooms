module PreparedQuestions
  class TheMostDurableFlexibleQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
