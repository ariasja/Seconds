FactoryGirl.define do
  factory :user do
    first_name     "Jason"
    last_name	"Arias"
    email    "jason.a.arias@vanderbilt.edu"
    bio	"Produced in spec/support/factories.rb"
    password "foobar"
    password_confirmation "foobar"
  end
end