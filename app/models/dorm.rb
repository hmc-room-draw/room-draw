class Dorm < ApplicationRecord

  validates :class, presence: true
  validates :suite, presence: true
  validates :room, presence: true

  has_many :suite
  has_many :room
end
