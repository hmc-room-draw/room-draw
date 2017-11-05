class Pull < ApplicationRecord
  has_many :room_assignments
  has_many :students, through: :room_assignments
  belongs_to :student

  #TO DO: ensure students are not in another pull
end
