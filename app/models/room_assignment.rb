class RoomAssignment < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :pull, optional: true
  belongs_to :room, optional: true
end
