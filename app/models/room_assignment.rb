class RoomAssignment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :pull, optional: true
  belongs_to :room

  enum assignment_type: [:preplaced, :freshman, :pulled, :unavailable, :other]
  validates :assignment_type, presence: true
end
