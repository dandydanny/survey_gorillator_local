class User < ActiveRecord::Base
  has_many :surveys
  has_many :chosen_answers 
  has_many :taken_surveys

  include BCrypt
  
  has_secure_password
end
