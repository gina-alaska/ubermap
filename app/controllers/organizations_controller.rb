class OrganizationsController < ApplicationController
  layout 'manager'

  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  authorize_resource

  def index
    @organizations = Organization.accessible_by(current_ability)
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.users << current_user

    respond_to do |format|
      if @organization.save
        format.html { redirect_to organization_url(@organization), notice: 'Organization was successfully created.' }
        format.json { render action: 'index', status: :created, location: @organization }
      else
        format.html { render action: 'new' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to organizations_url, notice: 'Organization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, error: 'Organization Deleted' }
      format.json { head :no_content }
    end
  end

  private
    def set_organization
      @organization = Organization.friendly.find(params[:id])
    end

    def organization_params
      params.require(:organization).permit(:name, :description, organizations_user_attributes: [:id, :name, :user_id, :_destroy])
    end
end
