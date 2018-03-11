class RoomAssignment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :pull, optional: true
  belongs_to :room

  enum assignment_type: [:preplaced, :frosh, :pulled, :unavailable, :other]
  validates :assignment_type, presence: true
  validates :student_id, uniqueness: true, allow_nil: true
  validates :pull_id, uniqueness: false, allow_nil: true

  validate :validate_room

  private
    def validate_room
      errors.add(:room, "already full") if room.room_assignments.size == room.capacity
    end
end
