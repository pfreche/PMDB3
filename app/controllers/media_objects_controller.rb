class MediaObjectsController < ApplicationController
  # GET /media_objects
  # GET /media_objects.json
  def index
    @media_objects = MediaObject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @media_objects }
    end
  end

  # GET /media_objects/1
  # GET /media_objects/1.json
  def show
    @media_object = MediaObject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @media_object }
    end
  end

  # GET /media_objects/new
  # GET /media_objects/new.json
  def new
    @media_object = MediaObject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @media_object }
    end
  end

  # GET /media_objects/1/edit
  def edit
    @media_object = MediaObject.find(params[:id])
  end

  # GET /media_objects/1/edit2
  def edit2
    @media_object = MediaObject.find(params[:id])
    if @media_object.typ_id == 1
      redirect_to edit_location_path(@media_object.location)
    end
  end

  # POST /media_objects
  # POST /media_objects.json
  def create
    @media_object = MediaObject.new(params[:media_object])

    respond_to do |format|
      if @media_object.save
        format.html { redirect_to @media_object, notice: 'Media object was successfully created.' }
        format.json { render json: @media_object, status: :created, location: @media_object }
      else
        format.html { render action: "new" }
        format.json { render json: @media_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media_objects/1
  # PUT /media_objects/1.json
  def update
    @media_object = MediaObject.find(params[:id])

    respond_to do |format|
      if @media_object.update_attributes(params[:media_object])
        format.html { redirect_to @media_object, notice: 'Media object was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @media_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_objects/1
  # DELETE /media_objects/1.json
  def destroy
    @media_object = MediaObject.find(params[:id])
    @media_object.destroy

    respond_to do |format|
      format.html { redirect_to media_objects_url }
      format.json { head :ok }
    end
  end

  def add_attri
    @media_object = MediaObject.find(params[:id])
    if params[:commit] == "Create"
      Attri.create(name: params[:name], agroup_id: 1, group_id: 1)
    end
    @attri_name = params[:name]
    attri = Attri.find_by_name(params[:name])
    if attri != nil
       @media_object.attris << attri unless @media_object.attris.exists?(attri)
    else
      @newAttribute = true
    end

    respond_to do |format|
      format.html {  redirect_to edit_location_path(@media_object.location)}
      format.js
    end

  end

  def remove_attri
    @media_object = MediaObject.find(params[:id])
    attri = Attri.find(params[:attri_id])
    @media_object.attris.delete(attri)
    redirect_to edit_location_path(@media_object.location)
  end
end

