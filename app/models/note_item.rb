class NoteItem < ApplicationRecord
  belongs_to :note

  validates :body, presence: true

  after_create_commit -> {
    broadcast_append_later_to self,
    partial: 'note_items/note_item',
    locals: {note: self.note, note_item: self},
    target: "note_#{self.note.id}"
  }

  after_update_commit -> {
    broadcast_replace_later_to self,
    partial: 'note_items/note_item',
    locals: {note: self.note, note_item: self},
    target: "note_item_#{self.id}"
  }

  after_destroy_commit -> {
    broadcast_remove_to self,
    target: "note_item_#{self.id}"
  }
end
