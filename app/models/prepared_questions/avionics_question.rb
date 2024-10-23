module PreparedQuestions
  class AvionicsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
