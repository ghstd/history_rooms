module PreparedQuestions
  class MoviesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
