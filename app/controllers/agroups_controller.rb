class AgroupsController < ApplicationController
  # GET /agroups
  # GET /agroups.json
  def index
    @agroups = Agroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agroups }
    end
  end

  # GET /agroups/1
  # GET /agroups/1.json
  def show
    @agroup = Agroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agroup }
    end
  end

  # GET /agroups/new
  # GET /agroups/new.json
  def new
    @agroup = Agroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agroup }
    end
  end

  # GET /agroups/1/edit
  def edit
    @agroup = Agroup.find(params[:id])
  end

  # POST /agroups
  # POST /agroups.json
  def create
    @agroup = Agroup.new(params[:agroup])

    respond_to do |format|
      if @agroup.save
        format.html { redirect_to @agroup, notice: 'Agroup was successfully created.' }
        format.json { render json: @agroup, status: :created, location: @agroup }
      else
        format.html { render action: "new" }
        format.json { render json: @agroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agroups/1
  # PUT /agroups/1.json
  def update
    @agroup = Agroup.find(params[:id])

    respond_to do |format|
      if @agroup.update_attributes(params[:agroup])
        format.html { redirect_to @agroup, notice: 'Agroup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @agroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agroups/1
  # DELETE /agroups/1.json
  def destroy
    @agroup = Agroup.find(params[:id])
    @agroup.destroy

    respond_to do |format|
      format.html { redirect_to agroups_url }
      format.json { head :ok }
    end
  end
end
