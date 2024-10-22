module PreparedQuestions
  class WorldSectsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
