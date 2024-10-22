module PreparedQuestions
  class TaleOfTheTemplarsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
