class UsersController < ApplicationController
  include SessionHelper

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /newUser
  def newUser

    email = params[:inputEmail]
    password = params[:inputPassword]
    confirm = params[:inputPasswordRepeat]

    @user = User.find_by_email(email)

    if @user
      if @user.password == password
        logger.info "Password matches!"
      end
    else
      logger.info "No User found... Creating new"
      @user = User.new
      @user.login = email.split('@', 2)[0]
      @login_user = User.find_by_login(@user.login)
      if @login_user
        logger.info "Login already taken! Using random number instead"
        flash.now[:warning] = "Login already taken! Using random number instead"
        while @login_user
          @user.login = "#{email.split('@', 2)[0]}#{Random.rand(1000).to_i}"
          @login_user = User.find_by_login(@user.login)
        end
      end

      @user.email = email
      @user.password = password
      @user.verified = false
      @user.save

      sign_in(@user)
      flash[:success] = "Bienvenido a Llevame!"

    end
    render 'main/llevame', :layout => false
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
