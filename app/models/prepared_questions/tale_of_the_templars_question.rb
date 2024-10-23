module PreparedQuestions
  class TaleOfTheTemplarsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
