class AssemblyGuidesController < ApplicationController
  # GET /assembly_guides
  # GET /assembly_guides.json
  def index
    @assembly_guides = AssemblyGuide.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assembly_guides }
    end
  end

  # GET /assembly_guides/1
  # GET /assembly_guides/1.json
  def show
    @assembly_guide = AssemblyGuide.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assembly_guide }
    end
  end

  # GET /assembly_guides/new
  # GET /assembly_guides/new.json
  def new
    @assembly_guide = AssemblyGuide.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assembly_guide }
    end
  end

  # GET /assembly_guides/1/edit
  def edit
    @assembly_guide = AssemblyGuide.find(params[:id])
  end

  # POST /assembly_guides
  # POST /assembly_guides.json
  def create
    @assembly_guide = AssemblyGuide.new(params[:assembly_guide])

    respond_to do |format|
      if @assembly_guide.save
        format.html { redirect_to @assembly_guide, notice: 'Assembly guide was successfully created.' }
        format.json { render json: @assembly_guide, status: :created, location: @assembly_guide }
      else
        format.html { render action: "new" }
        format.json { render json: @assembly_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assembly_guides/1
  # PUT /assembly_guides/1.json
  def update
    @assembly_guide = AssemblyGuide.find(params[:id])

    respond_to do |format|
      if @assembly_guide.update_attributes(params[:assembly_guide])
        format.html { redirect_to @assembly_guide, notice: 'Assembly guide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assembly_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_guides/1
  # DELETE /assembly_guides/1.json
  def destroy
    @assembly_guide = AssemblyGuide.find(params[:id])
    @assembly_guide.destroy

    respond_to do |format|
      format.html { redirect_to assembly_guides_url }
      format.json { head :no_content }
    end
  end
end
