# frozen_string_literal: true

# an Auth class
class AuthenticateUser
  def initialize(email_login, password)
    @email_login = email_login
    @password = password
    @user = User.find_by('email=?', email_login)
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id, username: user.name) if user
  end

  def recount_signin!
    @user.increment!(:sign_in_count, 1)
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    return @user if @user&.authenticate(password)

    raise Message.not_valid_email_or_password
  end
end
