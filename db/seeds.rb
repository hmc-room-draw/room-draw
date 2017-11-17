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

#Dorms

Dorm.create([{name: 'Case'}])
Dorm.create([{ name: 'Atwood'}])
Dorm.create([{ name: 'East'}])
Dorm.create([{ name: 'Drinkward'}])
Dorm.create([{ name: 'Linde'}])
Dorm.create([{ name: 'North'}])
Dorm.create([{ name: 'South'}])
Dorm.create([{ name: 'West'}])
Dorm.create([{ name: 'Sontag'}])

#Case

Room.create(number: '219', dorm_id: 1)
Room.create(number: '119', dorm_id: 1)
Room.create(number: '129', dorm_id: 1)
Room.create(number: '101', dorm_id: 1)
Room.create(number: '213', dorm_id: 1)
Room.create(number: '105', dorm_id: 1, suite_id: 1)
Room.create(number: '212', dorm_id: 1, suite_id: 2)
Room.create(number: '107', dorm_id: 1, suite_id: 3)
Room.create(number: '234', dorm_id: 1)
Room.create(number: '100', dorm_id: 1)

Suite.create(name: 'A', dorm_id: 1)
Suite.create(name: 'B', dorm_id: 1)
Suite.create(name: 'C', dorm_id: 1)
Suite.create(name: 'D', dorm_id: 1)
Suite.create(name: 'E', dorm_id: 1)

#Atwood

Room.create(number: '219', dorm_id: 2)
Room.create(number: '119', dorm_id: 2)
Room.create(number: '139', dorm_id: 2)
Room.create(number: '101', dorm_id: 2)
Room.create(number: '213', dorm_id: 2)
Room.create(number: '145', dorm_id: 2)
Room.create(number: '222', dorm_id: 2, suite_id: 6)
Room.create(number: '107', dorm_id: 2, suite_id: 9)
Room.create(number: '234', dorm_id: 2, suite_id: 8)
Room.create(number: '100', dorm_id: 2)

Suite.create(name: 'A', dorm_id: 2)
Suite.create(name: 'B', dorm_id: 2)
Suite.create(name: 'C', dorm_id: 2)
Suite.create(name: 'T', dorm_id: 2)
Suite.create(name: 'E', dorm_id: 2)

#East

Room.create(number: '219', dorm_id: 3)
Room.create(number: '119', dorm_id: 3)
Room.create(number: '129', dorm_id: 3)
Room.create(number: '101', dorm_id: 3)
Room.create(number: '213', dorm_id: 3)
Room.create(number: '135', dorm_id: 3)
Room.create(number: '232', dorm_id: 3, suite_id: 12)
Room.create(number: '107', dorm_id: 3, suite_id: 14)
Room.create(number: '235', dorm_id: 3, suite_id: 15)
Room.create(number: '100', dorm_id: 3)

Suite.create(name: 'A', dorm_id: 3)
Suite.create(name: 'B', dorm_id: 3)
Suite.create(name: 'C', dorm_id: 3)
Suite.create(name: 'M', dorm_id: 3)
Suite.create(name: 'E', dorm_id: 3)

#Drinkward

Room.create(number: '219', dorm_id: 4)
Room.create(number: '117', dorm_id: 4)
Room.create(number: '119', dorm_id: 4)
Room.create(number: '101', dorm_id: 4, suite_id: 17)
Room.create(number: '253', dorm_id: 4, suite_id: 18)
Room.create(number: '135', dorm_id: 4, suite_id: 19)
Room.create(number: '222', dorm_id: 4)
Room.create(number: '107', dorm_id: 4)
Room.create(number: '234', dorm_id: 4)
Room.create(number: '100', dorm_id: 4)

Suite.create(name: 'A', dorm_id: 4)
Suite.create(name: 'B', dorm_id: 4)
Suite.create(name: 'C', dorm_id: 4)
Suite.create(name: 'L', dorm_id: 4)
Suite.create(name: 'E', dorm_id: 4)

#Linde

Room.create(number: '219', dorm_id: 5)
Room.create(number: '119', dorm_id: 5)
Room.create(number: '129', dorm_id: 5)
Room.create(number: '101', dorm_id: 5)
Room.create(number: '213', dorm_id: 5, suite_id: 22)
Room.create(number: '135', dorm_id: 5)
Room.create(number: '222', dorm_id: 5, suite_id: 23)
Room.create(number: '207', dorm_id: 5, suite_id: 25)
Room.create(number: '234', dorm_id: 5)
Room.create(number: '100', dorm_id: 5)

Suite.create(name: 'A', dorm_id: 5)
Suite.create(name: 'B', dorm_id: 5)
Suite.create(name: 'C', dorm_id: 5)
Suite.create(name: 'S', dorm_id: 5)
Suite.create(name: 'E', dorm_id: 5)

#North

Room.create(number: '219', dorm_id: 6, suite_id: 26)
Room.create(number: '119', dorm_id: 6, suite_id: 27)
Room.create(number: '129', dorm_id: 6, suite_id: 28)
Room.create(number: '101', dorm_id: 6)
Room.create(number: '213', dorm_id: 6)
Room.create(number: '135', dorm_id: 6)
Room.create(number: '222', dorm_id: 6)
Room.create(number: '177', dorm_id: 6)
Room.create(number: '234', dorm_id: 6)
Room.create(number: '100', dorm_id: 6)

Suite.create(name: 'A', dorm_id: 6)
Suite.create(name: 'B', dorm_id: 6)
Suite.create(name: 'H', dorm_id: 6)
Suite.create(name: 'D', dorm_id: 6)
Suite.create(name: 'E', dorm_id: 6)

#South

Room.create(number: '219', dorm_id: 7, suite_id: 31)
Room.create(number: '119', dorm_id: 7, suite_id: 33)
Room.create(number: '124', dorm_id: 7, suite_id: 35)
Room.create(number: '101', dorm_id: 7)
Room.create(number: '233', dorm_id: 7)
Room.create(number: '135', dorm_id: 7)
Room.create(number: '222', dorm_id: 7)
Room.create(number: '107', dorm_id: 7)
Room.create(number: '234', dorm_id: 7)
Room.create(number: '100', dorm_id: 7)

Suite.create(name: 'A', dorm_id: 7)
Suite.create(name: 'B', dorm_id: 7)
Suite.create(name: 'C', dorm_id: 7)
Suite.create(name: 'L', dorm_id: 7)
Suite.create(name: 'E', dorm_id: 7)

#West

Room.create(number: '219', dorm_id: 8, suite_id: 38)
Room.create(number: '119', dorm_id: 8, suite_id: 36)
Room.create(number: '139', dorm_id: 8, suite_id: 39)
Room.create(number: '111', dorm_id: 8)
Room.create(number: '213', dorm_id: 8)
Room.create(number: '135', dorm_id: 8)
Room.create(number: '222', dorm_id: 8)
Room.create(number: '107', dorm_id: 8)
Room.create(number: '244', dorm_id: 8)
Room.create(number: '100', dorm_id: 8)

Suite.create(name: 'A', dorm_id: 8)
Suite.create(name: 'F', dorm_id: 8)
Suite.create(name: 'C', dorm_id: 8)
Suite.create(name: 'D', dorm_id: 8)
Suite.create(name: 'E', dorm_id: 8)