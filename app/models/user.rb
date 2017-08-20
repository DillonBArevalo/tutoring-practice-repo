class User < ActiveRecord::Base
  # Remember to create a migration!

  include BCrypt

  has_many :articles
  has_many :buyer_requests, 
            class_name: 'Message',
            foreign_key: :purchaser_id
  has_many :seller_requests,
            # Things you want to sell
            class_name: 'Message',
            foreign_key: :seller_id
  has_many :buyers, 
            # creating the ability to see buyers through the things you want to sell
            through: :seller_requests, 
            # purchaser tells you the list of people who want to buy your stuff
            source: :purchaser

  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validate :password_valid

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # method below validates if the password is empty, and gives the user object an error
  def password_valid
    if password == ""
      errors.add(:password, 'can\'t be blank')
    end 
  end 

  # returns a true or false if they enter the right password
  # this method will be called in the login session route
  def authenticate(new_password)
    password == new_password
  end 
end




