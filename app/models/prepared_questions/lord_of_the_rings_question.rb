module PreparedQuestions
  class LordOfTheRingsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
