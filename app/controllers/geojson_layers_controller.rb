class GeojsonLayersController < ApplicationController
  before_action :set_map, only: [:remove, :add]
  before_action :set_geojson_layer, only: [:show, :edit, :update, :destroy, :remove, :add]

  respond_to :html, :json, :tilejson

  layout 'manager'
  
  # GET /geojson_layers
  # GET /geojson_layers.json
  def index
    @geojson_layers = GeojsonLayer.all
  end

  # GET /geojson_layers/1
  # GET /geojson_layers/1.json
  def show
  end

  # GET /geojson_layers/new
  def new
    @geojson_layer = GeojsonLayer.new
    
    render layout: 'editor'
  end

  # GET /geojson_layers/1/edit
  def edit
    render layout: 'editor'
  end
  
  def remove
    @map_layer = @map.map_layers.where(layer: @geojson_layer).first
    @map_layer.destroy

    redirect_to @map
  end
  
  def add
    @map.geojson_layers << @geojson_layer
    
    redirect_to @map
  end

  # POST /geojson_layers
  # POST /geojson_layers.json
  def create
    @geojson_layer = GeojsonLayer.new(geojson_layer_params)

    respond_to do |format|
      if @geojson_layer.save
        format.html { redirect_to edit_geojson_layer_path(@geojson_layer), notice: 'Layer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @geojson_layer }
        format.js { render text: "document.location = '#{edit_geojson_layer_path(@geojson_layer)}'"}
      else
        format.html { render action: 'new' }
        format.json { render json: @geojson_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /geojson_layers/1
  # PATCH/PUT /geojson_layers/1.json
  def update
    respond_to do |format|
      if @geojson_layer.update(geojson_layer_params)
        format.html { redirect_to edit_geojson_layer_path(@geojson_layer), notice: 'Layer was successfully updated.' }
        format.json { head :no_content }
        format.js {
          Rails.logger.info  @geojson_layer.previous_changes
          if @geojson_layer.previous_changes['file_uid']
            render js: "document.location='#{edit_geojson_layer_path(@geojson_layer)}';"
          end
        }
      else
        format.html { render action: 'edit' }
        format.json { render json: @geojson_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geojson_layers/1
  # DELETE /geojson_layers/1.json
  def destroy
    @geojson_layer.destroy
    respond_to do |format|
      format.html { redirect_to geojson_layers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geojson_layer
      @geojson_layer = GeojsonLayer.find(params[:id])
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.where('lower(slug) = ?', params[:map_id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geojson_layer_params
      params.require(:geojson_layer).permit(:name, :file, :active, :legend, :popup, :description, options: ['clickable', 'auto_zoom'], style: ['marker-color', 'marker-symbol', 'marker-text', 'stroke', 'stroke-width', 'stroke-opacity'])
    end
end
