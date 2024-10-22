module PreparedQuestions
  class MartialArtsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
