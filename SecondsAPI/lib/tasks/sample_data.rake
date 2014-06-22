namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_posts
    make_relationships
  end
end

def make_users
  User.create!(first_name: "Jason",
                   last_name: "Arias",
                   email: "jason.a.arias@vanderbilt.edu",
                   bio: "Entrepreneur. Lover. Lion.",
                   password: "jason116protect",
                   password_confirmation: "jason116protect",
                   admin: true)
      99.times do |n|
        name  = Faker::Name.name
        first_name  = name.split[0]
        last_name = name.split[1]
        bio = "This is a Test!"

        email = "example-#{n+1}@railstutorial.org"
        password  = "password"
        User.create!(first_name: first_name,
                     last_name: last_name,
                     email: email,
                     bio: bio,
                     password: password,
                     password_confirmation: password)
      end
end

def make_posts
  users = User.all(limit: 6)
    50.times do|n|
      caption = "Post: #{n}"
      users.each { |user| user.posts.create!(caption: caption, video_id: n+1) }
    end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end