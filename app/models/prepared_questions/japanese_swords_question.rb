module PreparedQuestions
  class JapaneseSwordsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
