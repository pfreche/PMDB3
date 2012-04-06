class StorageLocationsController < ApplicationController
  # GET /storage_locations
  # GET /storage_locations.json
  def index
    @storage_locations = StorageLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @storage_locations }
    end
  end

  # GET /storage_locations/1
  # GET /storage_locations/1.json
  def show
    @storage_location = StorageLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @storage_location }
    end
  end

  # GET /storage_locations/new
  # GET /storage_locations/new.json
  def new
    @storage_location = StorageLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @storage_location }
    end
  end

  # GET /storage_locations/1/edit
  def edit
    @storage_location = StorageLocation.find(params[:id])
  end

  # POST /storage_locations
  # POST /storage_locations.json
  def create
    @storage_location = StorageLocation.new(params[:storage_location])

    respond_to do |format|
      if @storage_location.save
        format.html { redirect_to @storage_location, notice: 'Storage location was successfully created.' }
        format.json { render json: @storage_location, status: :created, location: @storage_location }
      else
        format.html { render action: "new" }
        format.json { render json: @storage_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /storage_locations/1
  # PUT /storage_locations/1.json
  def update
    @storage_location = StorageLocation.find(params[:id])

    respond_to do |format|
      if @storage_location.update_attributes(params[:storage_location])
        format.html { redirect_to @storage_location, notice: 'Storage location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @storage_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storage_locations/1
  # DELETE /storage_locations/1.json
  def destroy
    @storage_location = StorageLocation.find(params[:id])
    @storage_location.destroy

    respond_to do |format|
      format.html { redirect_to storage_locations_url }
      format.json { head :ok }
    end
  end
  
  # Post /storage_locations/1/set
  def set
      @storage_location = StorageLocation.find(params[:id])
      @storage_location.inUse = true;
      @storage_location.save;
      
      storage_id = @storage_location.storage_id
      
      sls = StorageLocation.where("storage_id = ? AND id <> ?", storage_id, @storage_location.id)
      sls.each do |sl|
        sl.update_attributes(inUse: :false)        
      end
      redirect_to storage_locations_path, notice: 'storage gesetzt'   
  end
end
