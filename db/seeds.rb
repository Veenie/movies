bruce = User.create(username: "Batman", password: "pw")

leo = User.create(username: "dicap", password: "pw")

Movie.create(title: "The Dark Knight", rating: 5, user_id: bruce.id)


Movie.create(title: "The Waterboy", rating: 1, user_id: bruce.id)

Movie.create(title: "Inception", rating: 5, user_id: leo.id)
