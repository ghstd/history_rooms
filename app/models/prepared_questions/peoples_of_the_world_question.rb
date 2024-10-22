module PreparedQuestions
  class PeoplesOfTheWorldQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
