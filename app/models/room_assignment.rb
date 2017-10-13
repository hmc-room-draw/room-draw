class RoomAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :pull
  belongs_to :room
end
