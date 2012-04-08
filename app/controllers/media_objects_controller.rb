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
end
