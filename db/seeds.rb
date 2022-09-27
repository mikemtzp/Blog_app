# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create(name: 'Tom', photo: 'https://images.unsplash.com/photo-1454496522488-7a8e488e8606?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
                         bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1501973931234-5ac2964cd94a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
#                           bio: 'Teacher from Poland.')

# post_one = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
# post_two = Post.create(author: first_user, title: 'Hi', text: 'This is my second post')
# post_three = Post.create(author: first_user, title: 'Hola', text: 'This is my third post')

# post_four = Post.create(author: second_user, title: 'Warop', text: 'Post number one')
# post_five = Post.create(author: second_user, title: 'Warop', text: 'Post number two')
# post_six = Post.create(author: second_user, title: 'Warop', text: 'Post number three')

# Comment.create(post: post_one, author: first_user, text: 'Nice')
# Comment.create(post: post_two, author: first_user, text: 'Well done')
# Comment.create(post: post_three, author: first_user, text: 'Comment 1')
# Comment.create(post: post_three, author: first_user, text: 'Comment 2')
# Comment.create(post: post_three, author: first_user, text: 'Comment 3')
# Comment.create(post: post_three, author: first_user, text: 'Comment 4')
# Comment.create(post: post_three, author: first_user, text: 'Comment 5')
# Comment.create(post: post_three, author: first_user, text: 'Comment 6')
