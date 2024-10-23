module PreparedQuestions
  class EndsOfTheWorldQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
