module PreparedQuestions
  class TacticalMedicineQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
