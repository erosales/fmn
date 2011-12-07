class User < ActiveRecord::Base

  attr_accessor :password
  before_save :encrypt_password
  
  
  email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :email
  validates_uniqueness_of :email 
  validates_format_of :email, :with => email_regexp 
  validates_length_of :email, :maximum=>60, 
								  :message=>"Email less than 60 chars please."
								  
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..60, :too_long => "Password must be shorter than 60 chars",
												   :too_short => "Password must be at least 6 chars"
  validates_presence_of :password, :on => :create
  
  def self.authenticate(email, password)
    user = find_by_email(email)
	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
	  user
	else
	  nil
    end
  end
  
  def encrypt_password
    if password.present?
	  self.password_salt = BCrypt::Engine.generate_salt
	  self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end  
  end  
end