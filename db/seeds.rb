# A little sample data so the app feels alive. slash_migrate works off the
# database *schema*, so this isn't required to exercise the gem — it's just
# here so the tables aren't empty when you poke around in the console.
Comment.delete_all
Post.delete_all
Category.delete_all
Author.delete_all

ada = Author.create!(name: "Ada Lovelace", email: "ada@example.com", bio: "Mathematician and first programmer.", age: 36, active: true, born_on: "1815-12-10")
alan = Author.create!(name: "Alan Turing", email: "alan@example.com", age: 41, active: false, born_on: "1912-06-23")

rails_cat = Category.create!(name: "Rails", slug: "rails", featured: true)
Category.create!(name: "Databases", slug: "databases", featured: false)

post = Post.create!(title: "Hello, migrations", body: "A first post about schema changes.",
  author: ada, category: rails_cat, view_count: 42, rating: 4.5, reading_time: 3.2,
  published: true, published_at: Time.current)
Post.create!(title: "Draft thoughts", body: "Still a work in progress.", author: alan, view_count: 0)

Comment.create!(post: post, commenter: alan, body: "Great first post!", approved: true)

puts "Seeded #{Author.count} authors, #{Category.count} categories, #{Post.count} posts, #{Comment.count} comments."
