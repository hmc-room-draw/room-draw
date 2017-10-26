class RoomAssignment < ApplicationRecord

  validates :student, presence: true
  validates :pull, presence: true
  validates :room, presence: true

  belongs_to :student
  belongs_to :pull
  belongs_to :room

  enum assignment_type: [:preplaced, :freshman, :pulled, :unavailable, :other]
end
