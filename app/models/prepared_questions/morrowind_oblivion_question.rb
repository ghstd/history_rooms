module PreparedQuestions
  class MorrowindOblivionQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
