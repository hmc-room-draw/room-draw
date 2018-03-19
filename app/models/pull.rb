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
    logger.debug "DEBUGGGING \n\n\n\n\n\n"
    logger.debug outranks.to_s
    logger.debug "self.round "
    logger.debug self.round.to_s
    logger.debug "other.round "
    logger.debug other.round.to_s
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

  def has_conflicting_nonpulls
    room_ids = self.room_assignments.map{ |ra| ra.room_id }
    conflicting_assignments = RoomAssignment.where(room_id: room_ids).where.not(id: self.id)
    cnps = conflicting_assignments.select{ |asn| asn.assignment_type != 'pulled' }
    not cnps.empty?
  end

  def include_student
    students = self.room_assignments.map{ |ra| ra.student}
    return students.include?(self.student)
  end

  def include_specific_student(user)
    students = self.room_assignments.map{ |ra| ra.student}
    return user.student.nil? || students.include?(user.student)
  end

  def check_unique
    students = self.room_assignments.map{ |ra| ra.student}
    return students.uniq.length == students.length
  end

  private
    def validate_student
      errors.add(:student, "not in :students") if not students.include?(student)
    end

    def validate_room_assignments
      errors.add(:room_assignments, "too many") if room_assignments.size > room.capacity
    end

  #check student conflicts/frosh/preplaced people check room assignments
  #
end
