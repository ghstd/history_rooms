module PreparedQuestions
  class RadioCommunicationQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
