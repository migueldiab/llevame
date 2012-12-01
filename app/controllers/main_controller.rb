# encoding: utf-8
class MainController < ApplicationController
  include SessionHelper

  def home
    @welcomeMsg = "Encontramos la manera mas fácil, segura y ecológica de viajar."
    @motto = "Uruguay, mas lindo, mas cerca"


  end

  def registrar
    @formHeading = "Registrate!"
    render :layout => false
  end

  def llevame

    render :layout => false
  end

  def contact
    @title = "Contacto"
  end

  def about
  end

end
