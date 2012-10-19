class MainController < ApplicationController
  def home
    @welcomeMsg = "\u03a3"
  end

  def contact
  	@title = "Contacto"
  end

  def about
  end

end
