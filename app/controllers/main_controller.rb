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
    email = params[:inputEmail]
    password = params[:inputPassword]


    @user = User.find_by_email(email)

    if @user

    end
    render 'llevame', :layout => false
  end

  def contact
    @title = "Contacto"
  end

  def about
  end

end
