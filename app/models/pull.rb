class Pull < ApplicationRecord
  has_many :room_assignments, dependent: :destroy
  has_many :students, through: :room_assignments

  accepts_nested_attributes_for :room_assignments, reject_if: proc { |attributes| attributes ["student_id"] == "" || attributes ["room_id"] == "" }
  #TODO: add rejection parameters for :room_assignments

  belongs_to :student

  validates :room_assignments, :presence => true
  validates :student, :presence => true

  # validate :validate_student

  # Checks if self can override another pull
  # @param other_pull
  #     Pull to be checked
  def can_override(other)
    outranks = self.student.outranks(other.student)

    if (self.student.senior? and other.student.senior?) then
      (self.round == other.round and outranks) or (self.round < other.round)
    else
      outranks
    end
  end

  # Returns a list of Pulls conflicting with this one
  def get_conflicting_pulls
    room_ids = self.room_assignments.map{ |ra| ra.room_id }
    conflicting_assignments = RoomAssignment.where(room_id: room_ids).where.not(id: self.id)
    conflicting_assignments.map{ |asn| asn.pull }
  end
  
  private
    def validate_student
      errors.add(:student, "not in :students") if not students.include?(student)
    end

  #check student conflicts/frosh/preplaced people check room assignments
  #
end
