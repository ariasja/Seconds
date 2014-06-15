class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :posts

	attr_accessor :first_name, :last_name, :email, :bio

	def initialize(attributes = {})
    	@first_name  = attributes[:first_name]
    	@last_name = attributes[:last_name]
    	@email = attributes[:email]
    	@bio = attributes[:bio]
  	end

	
end
