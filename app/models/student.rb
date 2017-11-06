class Student < ApplicationRecord
  validates :class_rank, presence: true
  validates :room_draw_number, presence: true

  belongs_to :user

  has_one :room_assignment
  has_one :pull, through: :room_assignment
  has_one :pull

  enum class_rank: [:freshman, :sophomore, :junior, :senior]

  scope :by_last_name, -> { joins(:user).order('users.last_name') }
end
