module PreparedQuestions
  class CocktailsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
