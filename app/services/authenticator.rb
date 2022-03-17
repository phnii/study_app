class Authenticator
  def initialize(user)
    @user = user
  end

  def authenticate(raw_password)
    @user && BCrypt::Password.new(@user.hashed_password) == raw_password
  end
end