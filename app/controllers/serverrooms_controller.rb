class ServerroomsController < ApplicationController
  # GET /serverrooms
  # GET /serverrooms.json
  def index
    if params[:id] != nil
      session[:id]= params[:id]
    end


    @serverrooms = Serverroom.where("office_id = ?", session[:id])
    @serverroom = Serverroom.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @serverrooms }
    end
  end

  # GET /serverrooms/1
  # GET /serverrooms/1.json
  def show
    @serverroom = Serverroom.find(params[:id])
    @serverrack = Serverrack.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @serverroom }
    end
  end

  # GET /serverrooms/new
  # GET /serverrooms/new.json
  def new
    @serverroom = Serverroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @serverroom }
    end
  end

  # GET /serverrooms/1/edit
  def edit
    @serverroom = Serverroom.find(params[:id])
  end

  # POST /serverrooms
  # POST /serverrooms.json
  def create
    @serverroom = Serverroom.new(params[:serverroom])

    respond_to do |format|
      if @serverroom.save
        format.html { redirect_to @serverroom, notice: 'Serverroom was successfully created.' }
        format.json { render json: @serverroom, status: :created, location: @serverroom }
      else
        format.html { render action: "new" }
        format.json { render json: @serverroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /serverrooms/1
  # PUT /serverrooms/1.json
  def update
    @serverroom = Serverroom.find(params[:id])

    respond_to do |format|
      if @serverroom.update_attributes(params[:serverroom])
        format.html { redirect_to @serverroom, notice: 'Serverroom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @serverroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /serverrooms/1
  # DELETE /serverrooms/1.json
  def destroy
    @serverroom = Serverroom.find(params[:id])
    @serverroom.destroy

    respond_to do |format|
      format.html { redirect_to serverrooms_url }
      format.json { head :no_content }
    end
  end
end
