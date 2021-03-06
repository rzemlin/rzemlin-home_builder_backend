# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Room.destroy_all
#Plan.destroy_all
#Todo.destroy_all
#Comment.destroy_all

#test1 = Room.create(room_name: "testRoom1")
#test2 = Room.create(room_name: "testRoom2")

#plan1 = Plan.create(description: "testPlan1", room_id: test1.id)
#plan2 = Plan.create(description: "testPlan2", room_id: test2.id)

#to_do1 = Todo.create(description: "testToDo1", plan_id: plan1.id)
#to_do2 = Todo.create(description: "testToDo2", plan_id: plan2.id)

#comment1 = Comment.create(content: "test comment for 1", room_id: test1.id)
#comment2 = Comment.create(content: "test comment for 2", room_id: test2.id)


Room.destroy_all
Comment.destroy_all
Plan.destroy_all
Todo.destroy_all

test1 = Room.create(room_name: "Test 1")
test2 = Room.create(room_name: "Test 2")

plan1a = test1.plans.create!(description: "Plan 1a")
plan1b = test2.plans.create!(description: "Plan 1b")

todo1a = plan1a.todos.create!(description: "todo 1a")
todo1b = plan1a.todos.create!(description: "todo 1b")

comment = test1.comments.create!(content: "test comment for first test")