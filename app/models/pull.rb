class Pull < ApplicationRecord

  validates :room_assignments, presence: true
  validates :student, presence: true

  has_many :room_assignments
  has_many :students, through: :room_assignments
  belongs_to :student
end
