class Room < ApplicationRecord
  validates :floor, presence: true
  validates :number, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }

  belongs_to :suite
  has_many :student
end
