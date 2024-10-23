module PreparedQuestions
  class CocktailsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
