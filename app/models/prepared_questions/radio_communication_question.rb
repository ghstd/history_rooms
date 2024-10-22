module PreparedQuestions
  class RadioCommunicationQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
