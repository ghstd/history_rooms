class Note < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :note_items, dependent: :destroy
end
