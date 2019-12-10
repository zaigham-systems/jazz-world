# app/auth/authenticate_user.rb
class AuthenticateUser
  prepend SimpleCommand
  attr_accessor :mobile_num, :password

  #this is where parameters are taken when the command is called
  def initialize(mobile_num, password)
    @mobile_num = mobile_num
    @password = password
  end

  #this is where the result gets returned
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  def user
    user = User.find_by_mobile_num(mobile_num)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end