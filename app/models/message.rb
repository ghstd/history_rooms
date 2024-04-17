class Message < ApplicationRecord
  belongs_to :room

  validates :body, presence: true
  validates :author, presence: true

  after_create_commit -> { broadcast_append_to self.room.room_id, partial: "messages/message", locals: { message: self }, target: "messages" }
end
