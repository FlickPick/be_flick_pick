# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "reed@turing.edu", password: "Reed!12345", name: 'Reed', role: 1)
User.create(email: "ethan@turing.edu", password: "Ethan!12345", name: 'Ethan', role: 1)
User.create(email: "tommy@turing.edu", password: "Tommy!12345", name: 'Tommy', role: 1)
User.create(email: "joop@turing.edu", password: "Joop!12345", name: 'Joop', role: 1)

Party.create(id: 222333444555, access_code: "012345", max_rating: "r", max_duration: 300, genres: "28", services: "337")


test_party = Party.create(id: 111222333444, access_code: "111222", max_rating: "r", max_duration: 300, genres: "28", services: "337", movie_id: 9479 )
  temp_user_1 = TempUser.create(name: "Annie", party: test_party)
    LikedMovie.create(temp_user: temp_user_1, round: 1, movie_id: 8392)
    LikedMovie.create(temp_user: temp_user_1, round: 1, movie_id: 9479)
    LikedMovie.create(temp_user: temp_user_1, round: 1, movie_id: 16859)
  temp_user_2 = TempUser.create(name: "Buck", party: test_party)
    LikedMovie.create(temp_user: temp_user_2, round: 1, movie_id: 8392)
    LikedMovie.create(temp_user: temp_user_2, round: 1, movie_id: 9479)
  temp_user_3 = TempUser.create(name: "Charlie", party: test_party)
    LikedMovie.create(temp_user: temp_user_3, round: 1, movie_id: 8392)

