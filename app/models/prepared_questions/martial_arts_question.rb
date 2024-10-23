module PreparedQuestions
  class MartialArtsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
