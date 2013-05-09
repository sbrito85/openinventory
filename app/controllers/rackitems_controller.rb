class RackitemsController < ApplicationController
  # GET /rackitems
  # GET /rackitems.json
  def index
    @rackitems = Rackitem.all
    @rackitem = Rackitem.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rackitems }
    end
  end

  # GET /rackitems/1
  # GET /rackitems/1.json
  def show
    @rackitem = Rackitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rackitem }
    end
  end

  # GET /rackitems/new
  # GET /rackitems/new.json
  def new
    @rackitem = Rackitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rackitem }
    end
  end

  # GET /rackitems/1/edit
  def edit
    @rackitem = Rackitem.find(params[:id])
  end

  # POST /rackitems
  # POST /rackitems.json
  def create
    @rackitem = Rackitem.new(params[:rackitem])

    respond_to do |format|
      if @rackitem.save
        format.html { redirect_to :back, notice: 'Rackitem was successfully created.' }
        format.json { render json: @rackitem, status: :created, location: @rackitem }
      else
        format.html { render action: "new" }
        format.json { render json: @rackitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rackitems/1
  # PUT /rackitems/1.json
  def update
    @rackitem = Rackitem.find(params[:id])

    respond_to do |format|
      if @rackitem.update_attributes(params[:rackitem])
        format.html { redirect_to @rackitem, notice: 'Rackitem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rackitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rackitems/1
  # DELETE /rackitems/1.json
  def destroy
    @rackitem = Rackitem.find(params[:id])
    @rackitem.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Rackitem removed' }
      format.json { head :no_content }
    end
  end
end
