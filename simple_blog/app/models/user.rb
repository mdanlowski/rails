class User < ApplicationRecord

  attr_accessor :email, :username, :password, :confirm_password
  # attr_accessible :email, :name, :password, :confirm_password
  has_secure_password




end
