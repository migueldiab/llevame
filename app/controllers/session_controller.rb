class SessionController < ApplicationController
  include SessionHelper
  respond_to :json

  def new

  end

  def destroy
    sign_out
    render 'main/home'
  end

  def loginFromCookies
    logger.info "Trying to login user..."
    respond_with current_user
  end


  def loginUser
    login = params[:login]
    password = params[:password]
    @user = User.find_by_login(login)

    if @user && @user.has_password?(password)
      logger.info 'Returning User : #{@user}'
      sign_in(@user)
      render :json => @user
    else
      logger.info 'Returning Error'
      response = ['Error' => 'Error 123']

      render :json => response, :status => 401
    end

  end

end
