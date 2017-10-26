class Pull < ApplicationRecord

  validates :message, presence: true

  has_many :room_assignments
  has_many :students, through: :room_assignments
  belongs_to :student
end
