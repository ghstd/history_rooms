module PreparedQuestions
  class NapoleonBonapartesLifeStoriesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
