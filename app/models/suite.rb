class Suite < ApplicationRecord

  validates :name, presence: true

  belongs_to :dorm
  has_many :rooms

  accepts_nested_attributes_for :rooms, allow_destroy: true
end
