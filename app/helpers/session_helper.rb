module SessionHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    cookies.permanent[:usuario] = [user.login]
    current_user= user
  end

  def sign_out
    cookies.delete(:remember_token)
    current_user= nil
  end


  def current_user
    logger.info "Get Current User"
    @current_user ||= user_from_remember_token
  end

  def current_user=(user)
    @current_user = user
  end

  private
  ###########################################
    def user_from_remember_token
      logger.info "Loading user from Remember Token"
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil,nil]
    end
  ###########################################
end
