class SegurosController < ApplicationController
  # GET /seguros
  # GET /seguros.json
  def index
    @seguros = Seguro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seguros }
    end
  end

  # GET /seguros/1
  # GET /seguros/1.json
  def show
    @seguro = Seguro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seguro }
    end
  end

  # GET /seguros/new
  # GET /seguros/new.json
  def new
    @seguro = Seguro.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seguro }
    end
  end

  # GET /seguros/1/edit
  def edit
    @seguro = Seguro.find(params[:id])
  end

  # POST /seguros
  # POST /seguros.json
  def create
    @seguro = Seguro.new(params[:seguro])

    respond_to do |format|
      if @seguro.save
        format.html { redirect_to @seguro, notice: 'Seguro was successfully created.' }
        format.json { render json: @seguro, status: :created, location: @seguro }
      else
        format.html { render action: "new" }
        format.json { render json: @seguro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seguros/1
  # PUT /seguros/1.json
  def update
    @seguro = Seguro.find(params[:id])

    respond_to do |format|
      if @seguro.update_attributes(params[:seguro])
        format.html { redirect_to @seguro, notice: 'Seguro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seguro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seguros/1
  # DELETE /seguros/1.json
  def destroy
    @seguro = Seguro.find(params[:id])
    @seguro.destroy

    respond_to do |format|
      format.html { redirect_to seguros_url }
      format.json { head :no_content }
    end
  end
end
