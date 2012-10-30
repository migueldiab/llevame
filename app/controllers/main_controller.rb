# encoding: utf-8
class MainController < ApplicationController
  def home
    @welcomeMsg = "Encontramos la manera mas fácil, segura y ecológica de viajar."
  end

  def registrar
    @formHeading = "Registrate!"
    render :layout => false
  end

  def contact
    @title = "Contacto"
  end

  def about
  end

end
