class Room < ApplicationRecord

  has_many :messages, dependent: :destroy

  before_create :set_room_id

  private

  def set_room_id
    self.room_id = SecureRandom.uuid
  end
end
