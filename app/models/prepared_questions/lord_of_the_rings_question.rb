module PreparedQuestions
  class LordOfTheRingsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
