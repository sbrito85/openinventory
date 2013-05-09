class ServerracksController < ApplicationController
  # GET /serverracks
  # GET /serverracks.json
  def index
    @serverracks = Serverrack.all
    @serverrack = Serverrack.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @serverracks }
    end
  end

  # GET /serverracks/1
  # GET /serverracks/1.json
  def show
    @serverrack = Serverrack.find(params[:id])
    @rackitem = Rackitem.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @serverrack }
    end
  end

  # GET /serverracks/new
  # GET /serverracks/new.json
  def new
    @serverrack = Serverrack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @serverrack }
    end
  end

  # GET /serverracks/1/edit
  def edit
    @serverrack = Serverrack.find(params[:id])
  end

  # POST /serverracks
  # POST /serverracks.json
  def create
    @serverrack = Serverrack.new(params[:serverrack])

    respond_to do |format|
      if @serverrack.save
        format.html { redirect_to :back, notice: 'Serverrack was successfully created.' }
        format.json { render json: @serverrack, status: :created, location: @serverrack }
      else
        format.html { render action: "new" }
        format.json { render json: @serverrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /serverracks/1
  # PUT /serverracks/1.json
  def update
    @serverrack = Serverrack.find(params[:id])

    respond_to do |format|
      if @serverrack.update_attributes(params[:serverrack])
        format.html { redirect_to @serverrack, notice: 'Serverrack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @serverrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serverracks/1
  # DELETE /serverracks/1.json
  def destroy
    @serverrack = Serverrack.find(params[:id])
    @serverrack.destroy

    respond_to do |format|
      format.html { redirect_to serverracks_url }
      format.json { head :no_content }
    end
  end
end
