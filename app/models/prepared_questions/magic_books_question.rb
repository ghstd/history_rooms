module PreparedQuestions
  class MagicBooksQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
