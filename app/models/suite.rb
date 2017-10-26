class Suite < ApplicationRecord

  validates :name, presence: true

  belongs_to :dorm
  has_many :room
end
