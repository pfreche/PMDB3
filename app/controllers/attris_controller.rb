class AttrisController < ApplicationController
  # GET /attris
  # GET /attris.json
  def index
    @attris = Attri.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attris }
    end
  end

  # GET /attris/1
  # GET /attris/1.json
  def show
    @attri = Attri.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attri }
    end
  end

  # GET /attris/new
  # GET /attris/new.json
  def new
    @attri = Attri.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attri }
    end
  end

  # GET /attris/1/edit
  def edit
    @attri = Attri.find(params[:id])
  end

  # POST /attris
  # POST /attris.json
  def create
    @attri = Attri.new(params[:attri])

    respond_to do |format|
      if @attri.save
        format.html { redirect_to @attri, notice: 'Attri was successfully created.' }
        format.json { render json: @attri, status: :created, location: @attri }
      else
        format.html { render action: "new" }
        format.json { render json: @attri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attris/1
  # PUT /attris/1.json
  def update
    @attri = Attri.find(params[:id])

    respond_to do |format|
      if @attri.update_attributes(params[:attri])
        format.html { redirect_to @attri, notice: 'Attri was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attris/1
  # DELETE /attris/1.json
  def destroy
    @attri = Attri.find(params[:id])
    @attri.destroy

    respond_to do |format|
      format.html { redirect_to attris_url }
      format.json { head :ok }
    end
  end

  # POST /attris/find

  def find

    attri = Attri.find_by_name(params[:name])
    if attri != nil
      a =MediaObject.joins(:attris).where("attris.id = ?", attri.id)
 #     @media_objects = attri.mediaObjects
      @media_objects = a 
      render 'media_objects/index'
    else
      @newAttribute = true
      render 'search'
    end

  end

  # GET /attriSearch

  def search

  end

end
