class RoomAssignment < ApplicationRecord

  validates :assignment_type, presence: true

  belongs_to :student
  belongs_to :pull
  belongs_to :room

  enum assignment_type: [:preplaced, :freshman, :pulled, :unavailable, :other]
end
