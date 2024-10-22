module PreparedQuestions
  class EnglishTensesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
