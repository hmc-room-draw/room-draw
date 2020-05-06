class Dorm < ApplicationRecord
  has_many :suites
  has_many :rooms

  accepts_nested_attributes_for :rooms, allow_destroy: true
  accepts_nested_attributes_for :suites, allow_destroy: true

  validates :name, :presence => true

	def unassigned_rooms
		# Old/slow: 
		#self.rooms.select { |r| !r.room_assignments.exists? }

		# We want a query like this:
		# select * from rooms LEFT JOIN room_assignments ra ON rooms.id = ra.room_id WHERE ra.room_id IS NULL
		self.rooms.select('id = 1')
		#self.rooms.joins(:user).select('EXISTS(SELECT "room_assignments".* FROM "room_assignments" WHERE "room_assignments"."room_id" = room_id)')
    
		#self.rooms.joins()
	end

	def unassigned_rooms_number
		ur = self.unassigned_rooms
		ur.length
	end
end
