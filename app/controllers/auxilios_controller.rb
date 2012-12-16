class AuxiliosController < ApplicationController
  # GET /auxilios
  # GET /auxilios.json
  def index
    @auxilios = Auxilio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auxilios }
    end
  end

  # GET /auxilios/1
  # GET /auxilios/1.json
  def show
    @auxilio = Auxilio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @auxilio }
    end
  end

  # GET /auxilios/new
  # GET /auxilios/new.json
  def new
    @auxilio = Auxilio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auxilio }
    end
  end

  # GET /auxilios/1/edit
  def edit
    @auxilio = Auxilio.find(params[:id])
  end

  # POST /auxilios
  # POST /auxilios.json
  def create
    @auxilio = Auxilio.new(params[:auxilio])

    respond_to do |format|
      if @auxilio.save
        format.html { redirect_to @auxilio, notice: 'Auxilio was successfully created.' }
        format.json { render json: @auxilio, status: :created, location: @auxilio }
      else
        format.html { render action: "new" }
        format.json { render json: @auxilio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /auxilios/1
  # PUT /auxilios/1.json
  def update
    @auxilio = Auxilio.find(params[:id])

    respond_to do |format|
      if @auxilio.update_attributes(params[:auxilio])
        format.html { redirect_to @auxilio, notice: 'Auxilio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auxilio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auxilios/1
  # DELETE /auxilios/1.json
  def destroy
    @auxilio = Auxilio.find(params[:id])
    @auxilio.destroy

    respond_to do |format|
      format.html { redirect_to auxilios_url }
      format.json { head :no_content }
    end
  end
end
