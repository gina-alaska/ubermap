class ManagerController < ApplicationController
  before_action :set_organization

  protected

  def set_organization
    @organization = Organization.friendly.find(params[:organization_id]) if params[:organization_id].present?
  end

  def current_ability
    @current_ability ||= ManagerAbility.new(@organization, current_user)
  end
end
