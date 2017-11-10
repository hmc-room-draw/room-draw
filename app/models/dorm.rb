class Dorm < ApplicationRecord
  has_many :suites
  has_many :rooms

  accepts_nested_attributes_for :rooms, allow_destroy: true
  accepts_nested_attributes_for :suites, allow_destroy: true

  validates :name, :presence => true
end
