class ModelosController < ApplicationController
  # GET /modelos
  # GET /modelos.json
  def index
    @modelos = Modelo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @modelos }
    end
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
    @modelo = Modelo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modelo }
    end
  end

  # GET /modelos/new
  # GET /modelos/new.json
  def new
    @modelo = Modelo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modelo }
    end
  end

  # GET /modelos/1/edit
  def edit
    @modelo = Modelo.find(params[:id])
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @modelo = Modelo.new(params[:modelo])

    respond_to do |format|
      if @modelo.save
        format.html { redirect_to @modelo, notice: 'Modelo was successfully created.' }
        format.json { render json: @modelo, status: :created, location: @modelo }
      else
        format.html { render action: "new" }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /modelos/1
  # PUT /modelos/1.json
  def update
    @modelo = Modelo.find(params[:id])

    respond_to do |format|
      if @modelo.update_attributes(params[:modelo])
        format.html { redirect_to @modelo, notice: 'Modelo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
    @modelo = Modelo.find(params[:id])
    @modelo.destroy

    respond_to do |format|
      format.html { redirect_to modelos_url }
      format.json { head :no_content }
    end
  end
end
