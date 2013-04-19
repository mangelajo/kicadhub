class KicadnetlistsController < ApplicationController
  # GET /kicadnetlists
  # GET /kicadnetlists.json
  def index
    @kicadnetlists = Kicadnetlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kicadnetlists }
    end
  end

  # GET /kicadnetlists/1
  # GET /kicadnetlists/1.json
  def show
    @kicadnetlist = Kicadnetlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kicadnetlist }
    end
  end

  # GET /kicadnetlists/new
  # GET /kicadnetlists/new.json
  def new
    @kicadnetlist = Kicadnetlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kicadnetlist }
    end
  end

  # GET /kicadnetlists/1/edit
  def edit
    @kicadnetlist = Kicadnetlist.find(params[:id])
  end

  # POST /kicadnetlists
  # POST /kicadnetlists.json
  def create
    @kicadnetlist = Kicadnetlist.new(params[:kicadnetlist])

    respond_to do |format|
      if @kicadnetlist.save
        format.html { redirect_to @kicadnetlist, notice: 'Kicadnetlist was successfully created.' }
        format.json { render json: @kicadnetlist, status: :created, location: @kicadnetlist }
      else
        format.html { render action: "new" }
        format.json { render json: @kicadnetlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /kicadnetlists/1
  # PUT /kicadnetlists/1.json
  def update
    @kicadnetlist = Kicadnetlist.find(params[:id])

    respond_to do |format|
      if @kicadnetlist.update_attributes(params[:kicadnetlist])
        format.html { redirect_to @kicadnetlist, notice: 'Kicadnetlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kicadnetlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kicadnetlists/1
  # DELETE /kicadnetlists/1.json
  def destroy
    @kicadnetlist = Kicadnetlist.find(params[:id])
    @kicadnetlist.destroy

    respond_to do |format|
      format.html { redirect_to kicadnetlists_url }
      format.json { head :no_content }
    end
  end
end
