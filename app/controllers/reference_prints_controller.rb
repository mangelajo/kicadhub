class ReferencePrintsController < ApplicationController
  # GET /reference_prints
  # GET /reference_prints.json
  def index
    @reference_prints = ReferencePrint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reference_prints }
    end
  end

  # GET /reference_prints/1
  # GET /reference_prints/1.json
  def show
    @reference_print = ReferencePrint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reference_print }
    end
  end

  # GET /reference_prints/new
  # GET /reference_prints/new.json
  def new
    @reference_print = ReferencePrint.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reference_print }
    end
  end

  # GET /reference_prints/1/edit
  def edit
    @reference_print = ReferencePrint.find(params[:id])
  end

  # POST /reference_prints
  # POST /reference_prints.json
  def create
    @reference_print = ReferencePrint.new(params[:reference_print])

    respond_to do |format|
      if @reference_print.save
        format.html { redirect_to @reference_print, notice: 'Reference print was successfully created.' }
        format.json { render json: @reference_print, status: :created, location: @reference_print }
      else
        format.html { render action: "new" }
        format.json { render json: @reference_print.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reference_prints/1
  # PUT /reference_prints/1.json
  def update
    @reference_print = ReferencePrint.find(params[:id])

    respond_to do |format|
      if @reference_print.update_attributes(params[:reference_print])
        format.html { redirect_to @reference_print, notice: 'Reference print was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reference_print.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reference_prints/1
  # DELETE /reference_prints/1.json
  def destroy
    @reference_print = ReferencePrint.find(params[:id])
    @reference_print.destroy

    respond_to do |format|
      format.html { redirect_to reference_prints_url }
      format.json { head :no_content }
    end
  end
end
