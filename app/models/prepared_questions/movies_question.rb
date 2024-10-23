module PreparedQuestions
  class MoviesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
