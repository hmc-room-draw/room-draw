class Suite < ApplicationRecord
  belongs_to :dorm
  has_many :room
end
