module PreparedQuestions
  class ElfTypesQuestion < ApplicationRecord
  serialize :options, JSON
  end
end
