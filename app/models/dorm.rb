class Dorm < ApplicationRecord
  has_many :suite
  has_many :room

  accepts_nested_attributes_for :rooms, allow_destroy: true
  accepts_nested_attributes_for :suites, allow_destroy: true
end
