class User < ApplicationRecord

  # attr_accessible :password, :password_confirmation
  # @TODO do sth about error message!
  has_secure_password

  validates :email, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 4, maximum: 20 }
  validates :password, :confirmation => true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


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