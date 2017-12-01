class Room < ApplicationRecord
  belongs_to :dorm
  belongs_to :suite, optional: true
  has_many :room_assignments
  has_many :students, through: :room_assignments
  has_many :students

  validates :capacity, presence: true
  validates :floor, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :number, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  def name
    dorm.name + " " + number
  end
end
