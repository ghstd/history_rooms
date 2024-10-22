module PreparedQuestions
  class HistoricalWeaponsCharacteristicsQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
