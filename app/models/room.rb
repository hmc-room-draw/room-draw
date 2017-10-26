class Room < ApplicationRecord

  validates :capacity, presence: true
  validates :floor, presence: true
  validates :number, presence: true

  belongs_to :dorm
  belongs_to :suite
  has_many :room_assignment
end
