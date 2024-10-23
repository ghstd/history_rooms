module PreparedQuestions
  class EnglishTensesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
