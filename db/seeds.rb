# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Hello', email: 'hello@gmail.com', username: 'hello', password: 'hello')

Lesson.create(title: '7 Wonders of the World', topic: 'speaking', content: 'Explore through each of the 7 wonders of the world. Choose the one you like the most and explain why.')

Role.create(status: 'mentor', interested_topics: 'speaking')
