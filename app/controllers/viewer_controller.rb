class ViewerController < ApplicationController
  def show
    @map = Map.where('lower(slug) = ?', params[:slug]).first
    @layers = Layer.active

    render layout: 'fullmap'
  end
end
