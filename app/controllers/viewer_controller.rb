class ViewerController < ApplicationController
  def show
    @map = Map.where('lower(slug) = ?', params[:slug]).first

    render layout: 'fullmap'
  end
end
