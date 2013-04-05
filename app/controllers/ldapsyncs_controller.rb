class LdapsyncsController < ApplicationController
  # GET /ldapsyncs
  # GET /ldapsyncs.json
  def index
    @ldapsyncs = Ldapsync.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ldapsyncs }
    end
  end

  # GET /ldapsyncs/1
  # GET /ldapsyncs/1.json
  def show
    @ldapsync = Ldapsync.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ldapsync }
    end
  end

  # GET /ldapsyncs/new
  # GET /ldapsyncs/new.json
  def new
    @ldapsync = Ldapsync.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ldapsync }
    end
  end

  # GET /ldapsyncs/1/edit
  def edit
    @ldapsync = Ldapsync.find(params[:id])
  end

  # POST /ldapsyncs
  # POST /ldapsyncs.json
  def create
    @ldapsync = Ldapsync.new(params[:ldapsync])

    respond_to do |format|
      if @ldapsync.save
        format.html { redirect_to @ldapsync, notice: 'Ldapsync was successfully created.' }
        format.json { render json: @ldapsync, status: :created, location: @ldapsync }
      else
        format.html { render action: "new" }
        format.json { render json: @ldapsync.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ldapsyncs/1
  # PUT /ldapsyncs/1.json
  def update
    @ldapsync = Ldapsync.find(params[:id])

    respond_to do |format|
      if @ldapsync.update_attributes(params[:ldapsync])
        format.html { redirect_to @ldapsync, notice: 'Ldapsync was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ldapsync.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ldapsyncs/1
  # DELETE /ldapsyncs/1.json
  def destroy
    @ldapsync = Ldapsync.find(params[:id])
    @ldapsync.destroy

    respond_to do |format|
      format.html { redirect_to ldapsyncs_url }
      format.json { head :no_content }
    end
  end
end
