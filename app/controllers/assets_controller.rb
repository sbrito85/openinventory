class AssetsController < ApplicationController
  # GET /assets
  # GET /assets.json
  helper_method :sort_column, :sort_direction
  def index
    if params[:id] != nil
      session[:id]= params[:id]
    end
    if params[:f] != nil
      session[:f]= params[:f]
    end
    if session[:f] == 'active'
      @assets = Asset.where("disposed = ? AND office_id = ?", false, session[:id]).order(sort_column + " " + sort_direction).page(params[:page]).per_page(50).search(params[:search])
    elsif session[:f]== 'retired'
      @assets= Asset.where("disposed = ? AND office_id = ?", true, session[:id]).page(params[:page]).per_page(50).search(params[:search]) #disposed assets
    elsif session[:f]== 'refresh'
      @assets = Asset.where("disposed = ? AND refresh <= ? AND office_id = ?", false, Date.today + 100, session[:id]).page(params[:page]).per_page(50).search(params[:search])#refresh
    else
      @assets = Asset.where("office_id = ?",  session[:id]).page(params[:page]).per_page(50).search(params[:search]) #refresh
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
      format.csv { render text: @assets.to_csv }
      format.xls #{ render text: @assets.to_csv(col_sep: "\t") }
      format.js
    end
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset = Asset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.json
  def new
    @asset = current_user.asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = current_user.asset.new(params[:asset])

    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render json: @asset, status: :created, location: @asset }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assets/1
  # PUT /assets/1.json
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy

    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end
  
  private

  def sort_column
    Asset.column_names.include?(params[:sort]) ? params[:sort] : "Asset"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
