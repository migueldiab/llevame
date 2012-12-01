class SessionController < ApplicationController
  include SessionHelper

  def new

  end

  def destroy

  end

  def login
    logger.info "Trying to login user..."
    @user = current_user
    if @user != nil
      logger.info "User loaded : #{@user.login}"
      render 'userInfo', :layout => false
    else
      logger.info "No user loaded"
      render 'formLogin', :layout => false
    end
  end
end
