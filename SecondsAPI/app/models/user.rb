class User < ActiveRecord::Base
    before_save { self.email = email.downcase }

	validates :first_name, presence: true, length: { maximum: 25 }
	validates :last_name, presence: true, length: { maximum: 25 }
	
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :bio, length: { maximum: 140 }
  has_secure_password


	 has_many :posts, dependent: :destroy

	# attr_accessor :first_name, :last_name, :email, :bio

	# def initialize(attributes = {})
 #    	@first_name  = attributes[:first_name]
 #    	@last_name = attributes[:last_name]
 #    	@email = attributes[:email]
 #    	@bio = attributes[:bio]
 #  	end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    Post.where("user_id = ?", id)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
	
