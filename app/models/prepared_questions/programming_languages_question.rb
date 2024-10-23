module PreparedQuestions
  class ProgrammingLanguagesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
