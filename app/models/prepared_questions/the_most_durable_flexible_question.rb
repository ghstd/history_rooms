module PreparedQuestions
  class TheMostDurableFlexibleQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
