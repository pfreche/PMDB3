class StorageLocationsController < ApplicationController
  
  # GET /storage_locations
  # GET /storage_locations.json
  def index
    @storage_locations = StorageLocation.order(:storage_id).all

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
    @storage = Storage.find(params[:storage_id])
    @storage_location.storage = @storage

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
  
  def scan_directory
    @storage_location = StorageLocation.find(params[:id])
    @filepath = @storage_location.filePath.uri
    @storage = @storage_location.storage

    h = Help.new
    path = @filepath + "/"+ @storage.path
    @entries = []
    if File.exist?(path)
      
      @entries = h.getDirectory(path)

      @entries = @entries.map do|e|
       a = e.sub(@filepath, "").sub(@storage.path,"").gsub("//","/")       
       i = a.index(/\/[^\/]+$/)
       if i 
         lfolder = a.slice(i+1,255)
         mpath = a.slice(0,i+1)
          a = mpath +"   " + lfolder
       else 
         lfolder = ""
         mpath = a
       end
       f = Folder.where("storage_id = ? and lfolder = ? and mpath = ?",@storage.id, lfolder, mpath).first
       unless f
         f = Folder.new(storage_id: @storage.id, lfolder: lfolder, mpath: mpath)
         m = MediaObject.new(name: lfolder, typ_id: 1024)
         f.mediaObject = m
         f.save
       end
       a
      end
      
   end 
   @entries << path
 end

 def scan_files
    @storage_location = StorageLocation.find(params[:id])
    @filepath = @storage_location.filePath.uri
    @storage = @storage_location.storage

    h = Help.new
    path = @filepath + "/"+ @storage.path
    @entries = []
    if File.exist?(path)
      
      @entries = h.getFiles(path)

      @entries = @entries.map do|e|
       a = e.sub(@filepath, "").sub(@storage.path,"").gsub("//","/")       
       i = a.index(/\/[^\/]+$/)
       if i 
         file = a.slice(i+1,255)
         path = a.slice(0,i)
         i = path.index(/\/[^\/]+$/)
           if i
             lfolder = path.slice(i+1,255)
             mpath = path.slice(0,i+1)
           else
             lfolder = path
             mpath = "/"
           end
       else 
         adafd
         file = a
         mpath = "/"
         lfolder = ""
       end
       a = mpath +"--- " + lfolder+"----" + file
       
       f = Folder.where("storage_id = ? and lfolder = ? and mpath = ?",@storage.id, lfolder, mpath).first
       unless f
         @stp = 1
         break
       end
       a = a + "   ::  "+ f.id.to_s
        
       
#       f = Folder.new(storage_id: @storage.id, lfolder: lfolder, mpath: mpath)
       mo = MediaObject.new(name: file, typ_id: 2, folder_id: f.id).save
#       f.mediaObject = m
#       f.save
        a
      end
      if @stp 
        @entries = ["please scan folders"]
      end
   end 

   
   render 'scan_directory'
 end

end
