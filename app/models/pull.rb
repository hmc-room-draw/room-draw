class Pull < ApplicationRecord
  has_many :room_assignments
  has_many :students, through: :room_assignments
  belongs_to :student

  # Checks if pull1 can overwrite pull2
  # @param pull1, pull2
  #			IDs of pulls to be checked	
  def self.check(pull1_id, pull2_id)
  	puts "heyyo"
  	puts pull1_id
  	puts pull2_id

  	@pull1 = Pull.find(pull1_id)
  	@pull2 = Pull.find(pull2_id)

  	# checks if pull1 has a lower number than pull2
  	if @pull1.student.room_draw_number < @pull2.student.room_draw_number
  		puts "can overwrite"
  		# check room assignments for a conflict
  		@pull1.room_assignments.each do |x|
  			puts x.room.number
  			@pull2.room_assignments.each do |y|
  				puts y.room.number
  				if x.room.number == y.room.number
  					puts "room number conflict!"
  					return true
  				end
  			end
  		end
  	end

  	return false
  end

end
