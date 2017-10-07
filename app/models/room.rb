class Room < ApplicationRecord
  belongs_to :suite
  has_many :student
end
