module PreparedQuestions
  class PeoplesOfTheWorldQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
