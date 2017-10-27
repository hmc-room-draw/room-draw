class Suite < ApplicationRecord
  belongs_to :dorm
  has_many :room

  accepts_nested_attributes_for :rooms, allow_destroy: true
end
