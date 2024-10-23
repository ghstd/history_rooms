module PreparedQuestions
  class HistoricalWeaponsCharacteristicsQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
