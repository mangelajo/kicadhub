class PcbsController < ApplicationController
  # GET /pcbs
  # GET /pcbs.json
  def index
    @pcbs = Pcb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pcbs }
    end
  end

  # GET /pcbs/1
  # GET /pcbs/1.json
  def show
    @pcb = Pcb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pcb }
    end
  end

  # GET /pcbs/new
  # GET /pcbs/new.json
  def new
    @pcb = Pcb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pcb }
    end
  end

  # GET /pcbs/1/edit
  def edit
    @pcb = Pcb.find(params[:id])
  end

  # POST /pcbs
  # POST /pcbs.json
  def create
    @pcb = Pcb.new(params[:pcb])

    respond_to do |format|
      if @pcb.save
        format.html { redirect_to @pcb, notice: 'Pcb was successfully created.' }
        format.json { render json: @pcb, status: :created, location: @pcb }
      else
        format.html { render action: "new" }
        format.json { render json: @pcb.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pcbs/1
  # PUT /pcbs/1.json
  def update
    @pcb = Pcb.find(params[:id])

    respond_to do |format|
      if @pcb.update_attributes(params[:pcb])
        format.html { redirect_to @pcb, notice: 'Pcb was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pcb.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pcbs/1
  # DELETE /pcbs/1.json
  def destroy
    @pcb = Pcb.find(params[:id])
    @pcb.destroy

    respond_to do |format|
      format.html { redirect_to pcbs_url }
      format.json { head :no_content }
    end
  end
end
