class SessionController < ApplicationController
  include SessionHelper
  respond_to :json

  def new

  end

  def destroy

  end

  def login
    logger.info "Trying to login user..."
    respond_with current_user
  end
end
