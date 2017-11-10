class Pull < ApplicationRecord
  has_many :room_assignments, dependent: :destroy
  has_many :students, through: :room_assignments
  belongs_to :student

  accepts_nested_attributes_for :room_assignments

  validates :room_assignments, :presence => true
  validates :student, :presence => true

  # Checks if self can overwrite another pull
  # @param other_pull
  #     Pull to be checked
  def can_override(other_pull)
    return self.student.room_draw_number > other_pull.student.room_draw_number
  end

  # Returns a list of Pulls conflicting with this one
  def get_conflicting_pulls
    room_ids = self.room_assignments.map{ |ra| ra.room_id }
    conflicting_assignments = RoomAssignment.where(room_id: room_ids).where.not(id: self.id)
    conflicting_assignments.map{ |asn| asn.pull }
  end

end