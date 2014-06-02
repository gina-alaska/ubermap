class WmsLayersController < ApplicationController
  before_action :set_wms_layer, only: [:show, :edit, :update, :destroy]


  layout 'manager'
  
  # GET /wms_layers
  # GET /wms_layers.json
  def index
    @wms_layers = WmsLayer.all
  end

  # GET /wms_layers/1
  # GET /wms_layers/1.json
  def show
  end

  # GET /wms_layers/new
  def new
    @wms_layer = WmsLayer.new
    
    render layout: 'editor'
  end

  # GET /wms_layers/1/edit
  def edit
    render layout: 'editor'
  end

  # POST /wms_layers
  # POST /wms_layers.json
  def create
    @wms_layer = WmsLayer.new(wms_layer_params)

    respond_to do |format|
      if @wms_layer.save
        format.html { redirect_to @wms_layer, notice: 'Wms layer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wms_layer }
        format.js { render text: "document.location = '#{edit_geojson_layer_path(@geojson_layer)}'"}
      else
        format.html { render action: 'new' }
        format.json { render json: @wms_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wms_layers/1
  # PATCH/PUT /wms_layers/1.json
  def update
    respond_to do |format|
      if @wms_layer.update(wms_layer_params)
        format.html { redirect_to @wms_layer, notice: 'Wms layer was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @wms_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wms_layers/1
  # DELETE /wms_layers/1.json
  def destroy
    @wms_layer.destroy
    respond_to do |format|
      format.html { redirect_to wms_layers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wms_layer
      @wms_layer = WmsLayer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wms_layer_params
      params.require(:wms_layer).permit(:url, :layers, :legend, :active, :options, :description, :name)
    end
end
