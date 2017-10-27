class Room < ApplicationRecord

  validates :capacity, presence: true
  validates :floor, presence: true, numericality => { :greater_than_or_equal_to => 0 }
  validates :number, presence: true, numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :dorm
  belongs_to :suite
  has_many :room_assignment
end
