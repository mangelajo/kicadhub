class SupplierSkusController < ApplicationController
  # GET /supplier_skus
  # GET /supplier_skus.json
  def index
    @supplier_skus = SupplierSku.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplier_skus }
    end
  end

  # GET /supplier_skus/1
  # GET /supplier_skus/1.json
  def show
    @supplier_sku = SupplierSku.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplier_sku }
    end
  end

  # GET /supplier_skus/new
  # GET /supplier_skus/new.json
  def new
    @supplier_sku = SupplierSku.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplier_sku }
    end
  end

  # GET /supplier_skus/1/edit
  def edit
    @supplier_sku = SupplierSku.find(params[:id])
  end

  # POST /supplier_skus
  # POST /supplier_skus.json
  def create
    @supplier_sku = SupplierSku.new(params[:supplier_sku])

    respond_to do |format|
      if @supplier_sku.save
        format.html { redirect_to @supplier_sku, notice: 'Supplier sku was successfully created.' }
        format.json { render json: @supplier_sku, status: :created, location: @supplier_sku }
      else
        format.html { render action: "new" }
        format.json { render json: @supplier_sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplier_skus/1
  # PUT /supplier_skus/1.json
  def update
    @supplier_sku = SupplierSku.find(params[:id])

    respond_to do |format|
      if @supplier_sku.update_attributes(params[:supplier_sku])
        format.html { redirect_to @supplier_sku, notice: 'Supplier sku was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplier_sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_skus/1
  # DELETE /supplier_skus/1.json
  def destroy
    @supplier_sku = SupplierSku.find(params[:id])
    @supplier_sku.destroy

    respond_to do |format|
      format.html { redirect_to supplier_skus_url }
      format.json { head :no_content }
    end
  end
end
