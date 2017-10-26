class Suite < ApplicationRecord

  validates :dorm, presence: true
  validates :room, presence: true

  belongs_to :dorm
  has_many :room
end
