class Student < ApplicationRecord
  validates :class, presence: true
  validates :room_draw_number, presence: true

  belongs_to :user
end
