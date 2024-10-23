module PreparedQuestions
  class StoryOfCaptainWilliamKiddQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
