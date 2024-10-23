module PreparedQuestions
  class MagicBooksQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
