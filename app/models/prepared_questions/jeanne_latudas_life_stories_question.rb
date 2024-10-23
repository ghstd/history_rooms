module PreparedQuestions
  class JeanneLatudasLifeStoriesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
