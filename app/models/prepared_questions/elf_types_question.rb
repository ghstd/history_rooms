module PreparedQuestions
  class ElfTypesQuestion < ApplicationRecord
    serialize :options, coder: JSON
  end
end
