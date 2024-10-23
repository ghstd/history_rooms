module PreparedQuestions
  class WorldSectsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
