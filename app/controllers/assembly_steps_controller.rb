class AssemblyStepsController < ApplicationController
  # GET /assembly_steps
  # GET /assembly_steps.json
  def index
    @assembly_steps = AssemblyStep.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assembly_steps }
    end
  end

  # GET /assembly_steps/1
  # GET /assembly_steps/1.json
  def show
    @assembly_step = AssemblyStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assembly_step }
    end
  end

  # GET /assembly_steps/new
  # GET /assembly_steps/new.json
  def new
    @assembly_step = AssemblyStep.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assembly_step }
    end
  end

  # GET /assembly_steps/1/edit
  def edit
    @assembly_step = AssemblyStep.find(params[:id])
  end

  # POST /assembly_steps
  # POST /assembly_steps.json
  def create
    @assembly_step = AssemblyStep.new(params[:assembly_step])

    respond_to do |format|
      if @assembly_step.save
        format.html { redirect_to @assembly_step, notice: 'Assembly step was successfully created.' }
        format.json { render json: @assembly_step, status: :created, location: @assembly_step }
      else
        format.html { render action: "new" }
        format.json { render json: @assembly_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assembly_steps/1
  # PUT /assembly_steps/1.json
  def update
    @assembly_step = AssemblyStep.find(params[:id])

    respond_to do |format|
      if @assembly_step.update_attributes(params[:assembly_step])
        format.html { redirect_to @assembly_step, notice: 'Assembly step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assembly_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assembly_steps/1
  # DELETE /assembly_steps/1.json
  def destroy
    @assembly_step = AssemblyStep.find(params[:id])
    @assembly_step.destroy

    respond_to do |format|
      format.html { redirect_to assembly_steps_url }
      format.json { head :no_content }
    end
  end
end
