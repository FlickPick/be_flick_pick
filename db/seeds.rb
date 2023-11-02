# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.create(email: "reed@turing.edu", password: "Reed!12345", name: 'Reed', role: 1)
User.create(email: "ethan@turing.edu", password: "Ethan!12345", name: 'Ethan', role: 1)
User.create(email: "tommy@turing.edu", password: "Tommy!12345", name: 'Tommy', role: 1)
User.create(email: "joop@turing.edu", password: "Joop!12345", name: 'Joop', role: 1)