class Dorm < ApplicationRecord

  validates :name, presence: true

  has_many :suite
  has_many :room
end
