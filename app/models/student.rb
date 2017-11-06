class Student < ApplicationRecord
  validates :class, presence: true
  validates :room_draw_number, presence: true

  belongs_to :user

  def initialize(class_rank, room_draw_num)

  	puts "IN INITIALIZE"
  	@class = class_rank
  	@room_draw_number = room_draw_num
  end

  def printStudent()
  	puts @class
  	puts @room_draw_number
  end

end
