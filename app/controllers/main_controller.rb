# encoding: utf-8
class MainController < ApplicationController
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

  def newUser
    @infoVar = "The parameters are : #{params[:inputEmail]} ..."
    @infoPass = "The parameters are : #{params[:inputPassword]} ..."

    render 'llevame', :layout => false
  end

  def contact
    @title = "Contacto"
  end

  def about
  end

end
