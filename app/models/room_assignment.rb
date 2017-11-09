class RoomAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :pull
  belongs_to :room

  enum assignment_type: [:preplaced, :freshman, :pulled, :unavailable, :other]
  validates :assignment_type, presence: true
end
