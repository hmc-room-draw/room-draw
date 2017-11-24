class Room < ApplicationRecord
  belongs_to :dorm
  belongs_to :suite
  has_many :room_assignment
end
