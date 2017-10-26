class Room < ApplicationRecord

  validates :dorm, presence: true
  validates :suite, presence: true

  belongs_to :dorm
  belongs_to :suite
  has_many :room_assignment
end
