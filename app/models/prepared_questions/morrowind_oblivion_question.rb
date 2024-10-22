module PreparedQuestions
  class MorrowindOblivionQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
