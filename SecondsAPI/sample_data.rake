namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(first_name: "Example" 
                 last_name: "User",
                 email: "example@railstutorial.org",
                 bio: "This is a Test!",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      full_name  = Faker::Name.name

      first_name  = "Example"
      last_name = "User-#{n}"
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
end