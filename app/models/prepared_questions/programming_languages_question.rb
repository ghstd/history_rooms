module PreparedQuestions
  class ProgrammingLanguagesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
