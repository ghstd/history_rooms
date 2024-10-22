module PreparedQuestions
  class EndsOfTheWorldQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
