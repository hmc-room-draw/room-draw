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


dorms = Dorm.create([{ name: 'Case' }])
dorms = Dorm.create([{ name: 'Atwood' }])
dorms = Dorm.create([{ name: 'East' }])
dorms = Dorm.create([{ name: 'Drinkward' }])
dorms = Dorm.create([{ name: 'Linde' }])
dorms = Dorm.create([{ name: 'North' }])
dorms = Dorm.create([{ name: 'South' }])
dorms = Dorm.create([{ name: 'West' }])

#Case

Room.create(number: '219', dorm: dorms.first)
Room.create(number: '119', dorm: dorms.first)
Room.create(number: '129', dorm: dorms.first)
Room.create(number: '101', dorm: dorms.first)
Room.create(number: '213', dorm: dorms.first)
Room.create(number: '105', dorm: dorms.first)
Room.create(number: '212', dorm: dorms.first)
Room.create(number: '107', dorm: dorms.first)
Room.create(number: '234', dorm: dorms.first)
Room.create(number: '100', dorm: dorms.first)

Suite.create(name: 'A', dorm: dorms.first)
Suite.create(name: 'B', dorm: dorms.first)
Suite.create(name: 'C', dorm: dorms.first)
Suite.create(name: 'D', dorm: dorms.first)
Suite.create(name: 'E', dorm: dorms.first)

#Atwood

Room.create(number: '219', dorm: dorms.second)
Room.create(number: '119', dorm: dorms.second)
Room.create(number: '139', dorm: dorms.second)
Room.create(number: '101', dorm: dorms.second)
Room.create(number: '213', dorm: dorms.second)
Room.create(number: '145', dorm: dorms.second)
Room.create(number: '222', dorm: dorms.second)
Room.create(number: '107', dorm: dorms.second)
Room.create(number: '234', dorm: dorms.second)
Room.create(number: '100', dorm: dorms.second)

Suite.create(name: 'A', dorm: dorms.second)
Suite.create(name: 'B', dorm: dorms.second)
Suite.create(name: 'C', dorm: dorms.second)
Suite.create(name: 'T', dorm: dorms.second)
Suite.create(name: 'E', dorm: dorms.second)

#East

Room.create(number: '219', dorm: dorms.third)
Room.create(number: '119', dorm: dorms.third)
Room.create(number: '129', dorm: dorms.third)
Room.create(number: '101', dorm: dorms.third)
Room.create(number: '213', dorm: dorms.third)
Room.create(number: '135', dorm: dorms.third)
Room.create(number: '232', dorm: dorms.third)
Room.create(number: '107', dorm: dorms.third)
Room.create(number: '235', dorm: dorms.third)
Room.create(number: '100', dorm: dorms.third)

Suite.create(name: 'A', dorm: dorms.third)
Suite.create(name: 'B', dorm: dorms.third)
Suite.create(name: 'C', dorm: dorms.third)
Suite.create(name: 'M', dorm: dorms.third)
Suite.create(name: 'E', dorm: dorms.third)

#Drinkward

Room.create(number: '219', dorm: dorms.fourth)
Room.create(number: '117', dorm: dorms.fourth)
Room.create(number: '119', dorm: dorms.fourth)
Room.create(number: '101', dorm: dorms.fourth)
Room.create(number: '253', dorm: dorms.fourth)
Room.create(number: '135', dorm: dorms.fourth)
Room.create(number: '222', dorm: dorms.fourth)
Room.create(number: '107', dorm: dorms.fourth)
Room.create(number: '234', dorm: dorms.fourth)
Room.create(number: '100', dorm: dorms.fourth)

Suite.create(name: 'A', dorm: dorms.fourth)
Suite.create(name: 'B', dorm: dorms.fourth)
Suite.create(name: 'C', dorm: dorms.fourth)
Suite.create(name: 'L', dorm: dorms.fourth)
Suite.create(name: 'E', dorm: dorms.fourth)

#Linde

Room.create(number: '219', dorm: dorms.fifth)
Room.create(number: '119', dorm: dorms.fifth)
Room.create(number: '129', dorm: dorms.fifth)
Room.create(number: '101', dorm: dorms.fifth)
Room.create(number: '213', dorm: dorms.fifth)
Room.create(number: '135', dorm: dorms.fifth)
Room.create(number: '222', dorm: dorms.fifth)
Room.create(number: '207', dorm: dorms.fifth)
Room.create(number: '234', dorm: dorms.fifth)
Room.create(number: '100', dorm: dorms.fifth)

Suite.create(name: 'A', dorm: dorms.fifth)
Suite.create(name: 'B', dorm: dorms.fifth)
Suite.create(name: 'C', dorm: dorms.fifth)
Suite.create(name: 'S', dorm: dorms.fifth)
Suite.create(name: 'E', dorm: dorms.fifth)

#North

Room.create(number: '219', dorm: dorms.third_to_last)
Room.create(number: '119', dorm: dorms.third_to_last)
Room.create(number: '129', dorm: dorms.third_to_last)
Room.create(number: '101', dorm: dorms.third_to_last)
Room.create(number: '213', dorm: dorms.third_to_last)
Room.create(number: '135', dorm: dorms.third_to_last)
Room.create(number: '222', dorm: dorms.third_to_last)
Room.create(number: '177', dorm: dorms.third_to_last)
Room.create(number: '234', dorm: dorms.third_to_last)
Room.create(number: '100', dorm: dorms.third_to_last)

Suite.create(name: 'A', dorm: dorms.third_to_last)
Suite.create(name: 'B', dorm: dorms.third_to_last)
Suite.create(name: 'H', dorm: dorms.third_to_last)
Suite.create(name: 'D', dorm: dorms.third_to_last)
Suite.create(name: 'E', dorm: dorms.third_to_last)

#South

Room.create(number: '219', dorm: dorms.second_to_last)
Room.create(number: '119', dorm: dorms.second_to_last)
Room.create(number: '124', dorm: dorms.second_to_last)
Room.create(number: '101', dorm: dorms.second_to_last)
Room.create(number: '233', dorm: dorms.second_to_last)
Room.create(number: '135', dorm: dorms.second_to_last)
Room.create(number: '222', dorm: dorms.second_to_last)
Room.create(number: '107', dorm: dorms.second_to_last)
Room.create(number: '234', dorm: dorms.second_to_last)
Room.create(number: '100', dorm: dorms.second_to_last)

Suite.create(name: 'A', dorm: dorms.second_to_last)
Suite.create(name: 'B', dorm: dorms.second_to_last)
Suite.create(name: 'C', dorm: dorms.second_to_last)
Suite.create(name: 'L', dorm: dorms.second_to_last)
Suite.create(name: 'E', dorm: dorms.second_to_last)

#West

Room.create(number: '219', dorm: dorms.last)
Room.create(number: '119', dorm: dorms.last)
Room.create(number: '139', dorm: dorms.last)
Room.create(number: '111', dorm: dorms.last)
Room.create(number: '213', dorm: dorms.last)
Room.create(number: '135', dorm: dorms.last)
Room.create(number: '222', dorm: dorms.last)
Room.create(number: '107', dorm: dorms.last)
Room.create(number: '244', dorm: dorms.last)
Room.create(number: '100', dorm: dorms.last)

Suite.create(name: 'A', dorm: dorms.last)
Suite.create(name: 'F', dorm: dorms.last)
Suite.create(name: 'C', dorm: dorms.last)
Suite.create(name: 'D', dorm: dorms.last)
Suite.create(name: 'E', dorm: dorms.last)

