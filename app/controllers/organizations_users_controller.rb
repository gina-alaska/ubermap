class OrganizationsUsersController < ApplicationController
  before_action :set_organization

  authorize_resource

  def new
    @users = User.where.not(id: @organization.users)
  end

  def create
    @user = User.find(params[:id])


    @organization.users << @user

    redirect_to @organization
  end

  def destroy
    @organization_users = OrganizationsUser.find(params[:id])

    respond_to do |format|
      if @organization_users.destroy
        format.html { redirect_to @organization, notice: 'Removed user from organization' }
      else
        format.html { redirect_to @organization, notice: 'Unable to remove user from organization' }
      end
    end
  end

  protected

  def set_organization
    @organization = Organization.friendly.find(params[:organization_id])
  end
end
