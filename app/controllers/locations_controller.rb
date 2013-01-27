class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/new
  # GET /locations/new.json
  def new
    @location = Location.new(params[:location])
    @location.usagetype = params[:ut]
    #location.href = "http://127.0.0.1/locations/new?location[uri]="+location.href

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @location }
    end
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find(params[:id])
    h = Help.new
    @media_object = h.get_media_object(@location, "bookmark")
    @tag = h.get_tag(@media_object)

  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(params[:location])

    ## Handling von verbundenen Objekten
    h = Help.new
    @media_object=h.new_media_object(@location, "bookmark")
    #    view_context.new_tag(@media_object)  // funktioniert
    @tag = h.new_tag(@media_object, params[:location][:name], nil)

    if @location.usagetype == 99
      @target = @location.uri
    else
      @target = @location
    end

    respond_to do |format|
      if @location.save
        #      @location.mediaObject =  @media_object
        format.html { redirect_to @target , notice: 'Location was successfully created.' }
        format.json { render json: @location, status: :created, location: @location }
      else
        format.html { render action: "new" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.json
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :ok }
    end
  end

  def upd_and_check
    @location = Location.find(params[:id])
    @media_object = @location.mediaObject

 #   if @location.update_attributes(params[:location])
      if File.exist?(@location.uri)
        @directoryOK = "Exists"
      end
      render action: "edit"
  #  else
   #   format.html { render action: "edit" }
  #    format.json { render json: @location.errors, status: :unprocessable_entity }
  #  end
  end

end
