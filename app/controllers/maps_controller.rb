class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :add_layer, :remove_layer, :available_layers_for]

  layout 'manager'

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    @layers = @map.layers
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  def available_layers_for
    @layers = Layer.active - @map.layers
  end

  def add_layer
    @layer = Layer.find(params[:layer])
    @map.layers << @layer unless @map.layers.include? @layer

    respond_to do |format|
      format.html { redirect_to @map }
      format.json { head :no_content }
    end
  end

  def remove_layer
    ml = @map.map_layers.where(layer_id: params[:layer]).first
    ml.destroy

    respond_to do |format|
      format.html { redirect_to @map }
      format.json { head :no_content }
    end
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render action: 'show', status: :created, location: @map }
      else
        format.html { render action: 'new' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.where('lower(slug) = ?', params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:title, :slug, :active)
    end
end
