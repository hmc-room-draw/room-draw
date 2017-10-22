class Room < ApplicationRecord
  belongs_to :dorm
  belongs_to :suite
end
