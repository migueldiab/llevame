class MainController < ApplicationController
  def home
    @welcomeMsg = "Bienvenido a "
  end

  def contact
  	@title = "Contacto"
  end

  def about
  end

end
