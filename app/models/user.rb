class User < ActiveRecord::Base
  #users can have flash cards. If users are removed, their flash cards are destroyed
  has_many :flashcards, dependent: :destroy
  
  #ensure that every user has a valid remember token right from the start - changes each time a user creates a new session (avoid hijacked sessions)
  before_create :create_remember_token
  
  #ensure user email is all downcase to ensure uniqueness - uses before_save callback
  before_save { self.email = email.downcase } 
  has_secure_password
  #ensure that users have a name of resonible length
  validates :name, presence: true, length: { maximum: 50 }
  #ensure email is valid & unique(regex from railstutorial.org)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false } 

  
  validates :password, length: { minimum: 8 }, presence: true
  
  #use a large random string as the remember token for sessions
  #this base64 token will be stored on the browser
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  #hash the remember token using SHA1 hashing algorithm (for speed)
  # this hash digest  (the result of running it through a one-way cryptographic hash funtion) will be stored in the database
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  #--------------PRIVATE---------------
  private
  
    #create the remember token for the session (security)
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
