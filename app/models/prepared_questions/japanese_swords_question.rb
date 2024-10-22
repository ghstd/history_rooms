module PreparedQuestions
  class JapaneseSwordsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
