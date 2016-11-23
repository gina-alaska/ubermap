class MultimapsController < ManagerController
  before_action :set_organization
  before_action :set_multimap

  authorize_resource

  # GET /multimaps
  # GET /multimaps.json
  def index
    # @multimaps = @organization.multimaps
    redirect_to @organization
  end

  # GET /multimaps/1
  # GET /multimaps/1.json
  def show
  end

  def available
    @maps = @organization.maps.where.not(id: @multimap.map_ids)
    respond_to do |format|
      format.html
    end
  end

  def activate
    @map = Map.friendly.find(params[:map])

    @mmm = @multimap.multimap_maps.where(map: @map).first
    @mmm.update_attribute(:active, !@mmm.active)

    redirect_to [@organization, @multimap]
  end

  def add
    @map = Map.friendly.find(params[:map])
    @multimap.maps << @map

    redirect_to [@organization, @multimap]
  end

  def remove
    @map = Map.friendly.find(params[:map])
    @multimap.maps.delete(@map)

    redirect_to [@organization, @multimap]
  end

  # GET /multimaps/new
  def new
    @multimap = @organization.multimaps.build
  end

  # GET /multimaps/1/edit
  def edit
  end

  # POST /multimaps
  # POST /multimaps.json
  def create
    @multimap = @organization.multimaps.build(multimap_params)

    respond_to do |format|
      if @multimap.save
        format.html { redirect_to [@organization, @multimap], notice: 'Multimap was successfully created.' }
        format.json { render action: 'show', status: :created, location: @multimap }
      else
        format.html { render action: 'new' }
        format.json { render json: @multimap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /multimaps/1
  # PATCH/PUT /multimaps/1.json
  def update
    respond_to do |format|
      if @multimap.update(multimap_params)
        format.html { redirect_to [@organization, @multimap], notice: 'Multimap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @multimap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /multimaps/1
  # DELETE /multimaps/1.json
  def destroy
    @multimap.destroy
    respond_to do |format|
      format.html { redirect_to @multimap.organization }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_multimap
      @multimap = Multimap.friendly.find(params[:id]) if params[:id].present?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def multimap_params
      params.require(:multimap).permit(:name, :active, :slug, :description)
    end
end
