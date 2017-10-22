class Dorm < ApplicationRecord
  has_many :suite
  has_many :room
end
