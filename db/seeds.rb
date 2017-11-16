# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Dorms: Case, Atwood, East, Drinkward, Linde, North, South, West
# Rooms: Rooms random from 100-299
# Suites: Random A-Z letters

#Users

User.create(first_name:"Stu", last_name:"Dent", email: "student@hmc.edu", is_admin: false)
User.create(first_name:"Stu1", last_name:"Dent1", email: "student1@hmc.edu", is_admin: false)
User.create(first_name:"Stu2", last_name:"Dent2", email: "student2@hmc.edu", is_admin: false)
User.create(first_name:"Stu3", last_name:"Dent3", email: "student3@hmc.edu", is_admin: false)
User.create(first_name:"Stu4", last_name:"Dent4", email: "student4@hmc.edu", is_admin: false)
User.create(first_name:"Stu5", last_name:"Dent5", email: "student5@hmc.edu", is_admin: false)
User.create(first_name:"Ad", last_name:"Min", email: "admin@hmc.edu", is_admin: true)
User.create(first_name:"Ad1", last_name:"Min1", email: "admin1@hmc.edu", is_admin: true)
User.create(first_name:"Ad2", last_name:"Min2", email: "admin2@hmc.edu", is_admin: true)
User.create(first_name:"Ad3", last_name:"Min3", email: "admin3@hmc.edu", is_admin: true)
User.create(first_name:"Ad4", last_name:"Min4", email: "admin4@hmc.edu", is_admin: true)

#Students

Student.create(user_id: 1, class_rank: :junior, room_draw_number: 1)
Student.create(user_id: 2, class_rank: :sophomore, room_draw_number: 2)
Student.create(user_id: 3, class_rank: :sophomore, room_draw_number: 3)
Student.create(user_id: 4, class_rank: :senior, room_draw_number: 4)
Student.create(user_id: 5, class_rank: :senior, room_draw_number: 5)




#Dorms

Dorm.create([{name: 'Case'}])
Dorm.create([{ name: 'Atwood'}])
Dorm.create([{ name: 'East'}])
Dorm.create([{ name: 'Drinkward'}])
Dorm.create([{ name: 'Linde'}])
Dorm.create([{ name: 'North'}])
Dorm.create([{ name: 'South'}])
Dorm.create([{ name: 'West'}])

#Case

Suite.create(name: 'A', dorm_id: 1)
Suite.create(name: 'B', dorm_id: 1)
Suite.create(name: 'C', dorm_id: 1)
Suite.create(name: 'D', dorm_id: 1)
Suite.create(name: 'E', dorm_id: 1)

Room.create(floor: 2, capacity: 2, number: '219', dorm_id: 1)
Room.create(floor: 1, capacity: 2, number: '119', dorm_id: 1)
Room.create(floor: 1, capacity: 4, number: '129', dorm_id: 1)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 1)
Room.create(floor: 2, capacity: 1, number: '213', dorm_id: 1)
Room.create(floor: 1, capacity: 1, number: '105', dorm_id: 1, suite_id: 1)
Room.create(floor: 2, capacity: 1, number: '212', dorm_id: 1, suite_id: 2)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 1, suite_id: 3)
Room.create(floor: 2, capacity: 1, number: '234', dorm_id: 1)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 1)

#Atwood


Suite.create(name: 'A', dorm_id: 2)
Suite.create(name: 'B', dorm_id: 2)
Suite.create(name: 'C', dorm_id: 2)
Suite.create(name: 'T', dorm_id: 2)
Suite.create(name: 'E', dorm_id: 2)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 2)
Room.create(floor: 1, capacity: 1, number: '119', dorm_id: 2)
Room.create(floor: 1, capacity: 1, number: '139', dorm_id: 2)
Room.create(floor: 1, capacity: 1, number: '101', dorm_id: 2)
Room.create(floor: 2, capacity: 1, number: '213', dorm_id: 2)
Room.create(floor: 1, capacity: 2, number: '145', dorm_id: 2)
Room.create(floor: 2, capacity: 2, number: '222', dorm_id: 2, suite_id: 6)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 2, suite_id: 9)
Room.create(floor: 2, capacity: 2, number: '234', dorm_id: 2, suite_id: 8)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 2)


############## YOU CAN ADD PULLS LIKE THIS ##############

@student1 = Student.find(1)
@room1 = Room.find(1)

@pull1 = Pull.new
@pull1.student_id = @student1.id
@pull1.room_assignments.build(
	student_id: @student1.id, 
	room_id: @room1.id, 
	assignment_type: :pulled)

@pull1.save


@student2 = Student.find(2)
@room2 = Room.find(2)

@pull2 = Pull.new
@pull2.student_id = @student2.id
@pull2.room_assignments.build(
	student_id: @student2.id, 
	room_id: @room2.id, 
	assignment_type: :pulled)

@pull2.save


# #East

Suite.create(name: 'A', dorm_id: 3)
Suite.create(name: 'B', dorm_id: 3)
Suite.create(name: 'C', dorm_id: 3)
Suite.create(name: 'M', dorm_id: 3)
Suite.create(name: 'E', dorm_id: 3)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 3)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 3)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 3)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 3)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 3)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 3)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 3, suite_id: 12)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 3, suite_id: 14)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 3, suite_id: 15)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 3)

# #Drinkward

Suite.create(name: 'A', dorm_id: 4)
Suite.create(name: 'B', dorm_id: 4)
Suite.create(name: 'C', dorm_id: 4)
Suite.create(name: 'L', dorm_id: 4)
Suite.create(name: 'E', dorm_id: 4)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 4)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 4)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 4)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 4)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 4)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 4)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 4, suite_id: 17)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 4, suite_id: 18)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 4, suite_id: 19)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 4)

# #Linde

Suite.create(name: 'A', dorm_id: 5)
Suite.create(name: 'B', dorm_id: 5)
Suite.create(name: 'C', dorm_id: 5)
Suite.create(name: 'S', dorm_id: 5)
Suite.create(name: 'E', dorm_id: 5)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 5)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 5)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 5)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 5)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 5)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 5)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 5, suite_id: 22)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 5, suite_id: 23)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 5, suite_id: 25)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 5)

# #North

Suite.create(name: 'A', dorm_id: 6)
Suite.create(name: 'B', dorm_id: 6)
Suite.create(name: 'H', dorm_id: 6)
Suite.create(name: 'D', dorm_id: 6)
Suite.create(name: 'E', dorm_id: 6)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 6)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 6)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 6)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 6)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 6)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 6)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 6, suite_id: 26)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 6, suite_id: 27)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 6, suite_id: 28)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 6)

# #South

Suite.create(name: 'A', dorm_id: 7)
Suite.create(name: 'B', dorm_id: 7)
Suite.create(name: 'C', dorm_id: 7)
Suite.create(name: 'L', dorm_id: 7)
Suite.create(name: 'E', dorm_id: 7)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 7)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 7)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 7)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 7)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 7)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 7)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 7, suite_id: 31)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 7, suite_id: 33)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 7, suite_id: 35)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 7)

# #West

Suite.create(name: 'A', dorm_id: 8)
Suite.create(name: 'F', dorm_id: 8)
Suite.create(name: 'C', dorm_id: 8)
Suite.create(name: 'D', dorm_id: 8)
Suite.create(name: 'E', dorm_id: 8)

Room.create(floor: 2, capacity: 1, number: '219', dorm_id: 8)
Room.create(floor: 1, capacity: 4, number: '119', dorm_id: 8)
Room.create(floor: 1, capacity: 2, number: '129', dorm_id: 8)
Room.create(floor: 1, capacity: 2, number: '101', dorm_id: 8)
Room.create(floor: 2, capacity: 2, number: '213', dorm_id: 8)
Room.create(floor: 1, capacity: 1, number: '135', dorm_id: 8)
Room.create(floor: 2, capacity: 3, number: '232', dorm_id: 8, suite_id: 38)
Room.create(floor: 1, capacity: 2, number: '107', dorm_id: 8, suite_id: 36)
Room.create(floor: 2, capacity: 2, number: '235', dorm_id: 8, suite_id: 39)
Room.create(floor: 1, capacity: 1, number: '100', dorm_id: 8)