module PreparedQuestions
  class AvionicsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
