class User < ApplicationRecord
  serialize :voted_for

  # attr_accessible :password, :password_confirmation
  has_secure_password
  has_one_attached :photo
  before_save { self.email = email.downcase }

  # validates :email
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :password, :confirmation => true, length: { minimum: 6 }, allow_nil: true
  # validates :password_confirmation, presence: true

  has_many :posts

end

####### @TIPS
# attr_accessor is used to define an attribute for object of
# Model which is not mapped with any column in database
#
# BUT!
# No mass assignment allowed for Rails 4.1
#
# instead of having attr_accessible :username, :email, :password, :password_confirmation in your model, use strong parameters. You'll do this in your UsersController:
#
#     def user_params
#       params.require(:user).permit(:username, :email, :password, :password_confirmation)
#     end
# then call the user_params method in your controller actions.
#
#######