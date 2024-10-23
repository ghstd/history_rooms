module PreparedQuestions
  class TacticalMedicineQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
